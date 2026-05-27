include(ch32h417)

include(CMakeParseArguments)

option(SEMIHOSTING "Enable semihosting")

if(CMAKE_GENERATOR STREQUAL "Ninja")
    find_program(CH32_PYTHON_INTERPRETER NAMES python3 python)
    set(CH32_RSP_LAUNCHER_SCRIPT "${CMAKE_SOURCE_DIR}/tools/ch32_msys_rsp_launcher.py")
    if(CH32_PYTHON_INTERPRETER AND EXISTS "${CH32_RSP_LAUNCHER_SCRIPT}")
        set(CH32_RSP_LAUNCHER "${CH32_PYTHON_INTERPRETER};${CH32_RSP_LAUNCHER_SCRIPT}")
    endif()

    set(CMAKE_C_RESPONSE_FILE_FLAG "")
    set(CMAKE_C_USE_RESPONSE_FILE_FOR_INCLUDES 0)
    set(CMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS 1)
    set(CMAKE_C_USE_RESPONSE_FILE_FOR_LIBRARIES 1)
    set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "@")
    set(CMAKE_ASM_RESPONSE_FILE_FLAG "")
    set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_INCLUDES 0)
    set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_OBJECTS 1)
    set(CMAKE_ASM_USE_RESPONSE_FILE_FOR_LIBRARIES 1)
    set(CMAKE_ASM_RESPONSE_FILE_LINK_FLAG "@")
endif()

set(CH32_INCLUDE_DIRS
    "${MAIN_SRC_DIR}/target"
)

set(CH32_DEFINITIONS
)

set(CH32_DEFAULT_HSE_MHZ 25)
set(CH32_LINKER_DIR "${MAIN_LIB_DIR}/main/CH32H417/Ld")

set(CH32_COMPILE_OPTIONS
    -ffunction-sections
    -fdata-sections
    -fno-common
    -Wno-comment
)

set(CH32_LINK_LIBRARIES
    -lm
    -lc
)

if(SEMIHOSTING)
    list(APPEND CH32_LINK_LIBRARIES --specs=rdimon.specs -lrdimon)
    list(APPEND CH32_DEFINITIONS SEMIHOSTING)
else()
    list(APPEND CH32_LINK_LIBRARIES -lnosys)
endif()

set(CH32_LINK_OPTIONS
    -nostartfiles
    --specs=nano.specs
    -static
    -Wl,-gc-sections
    -Wl,--cref
    -Wl,--print-memory-usage
)

macro(get_ch32_target_features output_var dir target_name)
    execute_process(COMMAND "${CMAKE_C_COMPILER}" -E -dD -D${ARGV2} "${ARGV1}/target.h"
        ERROR_VARIABLE _errors
        RESULT_VARIABLE _result
        OUTPUT_STRIP_TRAILING_WHITESPACE
        OUTPUT_VARIABLE _contents)

    if(NOT _result EQUAL 0)
        message(FATAL_ERROR "error extracting features for CH32 target ${ARGV2}: ${_errors}")
    endif()

    string(REGEX MATCH "#define[\t ]+USE_VCP" HAS_VCP ${_contents})
    if(HAS_VCP)
        list(APPEND ${ARGV0} VCP)
    endif()
    string(REGEX MATCH "define[\t ]+USE_FLASHFS" HAS_FLASHFS ${_contents})
    if(HAS_FLASHFS)
        list(APPEND ${ARGV0} FLASHFS)
    endif()
    string(REGEX MATCH "define[\t ]+USE_SDCARD" HAS_SDCARD ${_contents})
    if(HAS_SDCARD)
        list(APPEND ${ARGV0} SDCARD)
    endif()
endmacro()

function(add_ch32_hex_target name exe hex)
    add_custom_target(${name} ALL
        cmake -E env PATH="$ENV{PATH}"
        ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:${exe}> ${hex}
        BYPRODUCTS ${hex}
    )
endfunction()

function(add_ch32_bin_target name exe bin)
    add_custom_target(${name}.bin
        cmake -E env PATH="$ENV{PATH}"
        ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:${exe}> ${bin}
        BYPRODUCTS ${bin}
    )
endfunction()

function(ch32_generate_map_file target)
    if(CMAKE_VERSION VERSION_LESS 3.15)
        set(map "$<TARGET_FILE:${target}>.map")
    else()
        set(map "$<TARGET_FILE_DIR:${target}>/$<TARGET_FILE_BASE_NAME:${target}>.map")
    endif()
    target_link_options(${target} PRIVATE "-Wl,-Map,${map}")
endfunction()

function(ch32_set_linker_script target script)
    if(IS_ABSOLUTE "${script}")
        set(script_path "${script}")
    else()
        set(script_path "${CH32_LINKER_DIR}/${script}")
    endif()
    if(NOT EXISTS ${script_path})
        message(FATAL_ERROR "linker script ${script_path} doesn't exist")
    endif()
    set_target_properties(${target} PROPERTIES LINK_DEPENDS ${script_path})
    target_link_options(${target} PRIVATE -T${script_path})
endfunction()

function(add_ch32_executable)
    cmake_parse_arguments(
        args
        ""
        "FILENAME;NAME;OPTIMIZATION;OUTPUT_BIN_FILENAME;OUTPUT_HEX_FILENAME;OUTPUT_TARGET_NAME"
        "COMPILE_DEFINITIONS;COMPILE_OPTIONS;INCLUDE_DIRECTORIES;LINK_OPTIONS;LINKER_SCRIPT;SOURCES"
        ${ARGN}
    )

    set(elf_target ${args_NAME}.elf)
    add_executable(${elf_target})
    if(CH32_RSP_LAUNCHER)
        set_property(TARGET ${elf_target} PROPERTY C_COMPILER_LAUNCHER ${CH32_RSP_LAUNCHER})
        set_property(TARGET ${elf_target} PROPERTY ASM_COMPILER_LAUNCHER ${CH32_RSP_LAUNCHER})
    endif()
    target_sources(${elf_target} PRIVATE ${args_SOURCES})
    target_include_directories(${elf_target} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${args_INCLUDE_DIRECTORIES} ${CH32_INCLUDE_DIRS})
    target_compile_definitions(${elf_target} PRIVATE ${args_COMPILE_DEFINITIONS})
    target_compile_options(${elf_target} PRIVATE ${CH32_COMPILE_OPTIONS} ${args_COMPILE_OPTIONS})
    if(WARNINGS_AS_ERRORS)
        target_compile_options(${elf_target} PRIVATE -Werror)
    endif()
    if(IS_RELEASE_BUILD)
        target_compile_options(${elf_target} PRIVATE ${args_OPTIMIZATION})
        target_link_options(${elf_target} PRIVATE ${args_OPTIMIZATION})
    endif()
    target_link_libraries(${elf_target} PRIVATE ${CH32_LINK_LIBRARIES})
    target_link_options(${elf_target} PRIVATE ${CH32_LINK_OPTIONS} ${args_LINK_OPTIONS})
    ch32_generate_map_file(${elf_target})
    ch32_set_linker_script(${elf_target} ${args_LINKER_SCRIPT})

    if(args_FILENAME)
        set(basename ${CMAKE_BINARY_DIR}/${args_FILENAME})
        set(hex_filename ${basename}.hex)
        add_ch32_hex_target(${args_NAME} ${elf_target} ${hex_filename})
        set(bin_filename ${basename}.bin)
        add_ch32_bin_target(${args_NAME} ${elf_target} ${bin_filename})
    endif()

    if(args_OUTPUT_BIN_FILENAME)
        set(${args_OUTPUT_BIN_FILENAME} ${bin_filename} PARENT_SCOPE)
    endif()
    if(args_OUTPUT_TARGET_NAME)
        set(${args_OUTPUT_TARGET_NAME} ${elf_target} PARENT_SCOPE)
    endif()
    if(args_OUTPUT_HEX_FILENAME)
        set(${args_OUTPUT_HEX_FILENAME} ${hex_filename} PARENT_SCOPE)
    endif()
endfunction()

function(target_ch32)
    if(NOT riscv-none-elf STREQUAL TOOLCHAIN)
        return()
    endif()

    cmake_parse_arguments(
        args
        ""
        "HSE_MHZ;LINKER_SCRIPT;NAME;OPTIMIZATION;STARTUP;SVD"
        "COMPILE_DEFINITIONS;COMPILE_OPTIONS;INCLUDE_DIRECTORIES;LINK_OPTIONS;SOURCES"
        ${ARGN}
    )
    set(name ${args_NAME})

    if(args_HSE_MHZ)
        set(hse_mhz ${args_HSE_MHZ})
    else()
        set(hse_mhz ${CH32_DEFAULT_HSE_MHZ})
    endif()

    set(target_sources ${args_STARTUP})
    list(APPEND target_sources ${args_SOURCES})
    file(GLOB target_c_sources "${CMAKE_CURRENT_SOURCE_DIR}/*.c")
    file(GLOB target_h_sources "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
    list(APPEND target_sources ${target_c_sources} ${target_h_sources})

    set(target_include_directories ${args_INCLUDE_DIRECTORIES})
    set(target_definitions ${CH32_DEFINITIONS} ${COMMON_COMPILE_DEFINITIONS})

    math(EXPR hse_value "${hse_mhz} * 1000000")
    list(APPEND target_definitions "HSE_VALUE=${hse_value}")

    if(args_COMPILE_DEFINITIONS)
        list(APPEND target_definitions ${args_COMPILE_DEFINITIONS})
    endif()

    string(TOLOWER ${PROJECT_NAME} lowercase_project_name)
    set(binary_name ${lowercase_project_name}_${FIRMWARE_VERSION}_${name})
    if(DEFINED BUILD_SUFFIX AND NOT "" STREQUAL "${BUILD_SUFFIX}")
        set(binary_name "${binary_name}_${BUILD_SUFFIX}")
    endif()

    add_ch32_executable(
        NAME ${name}
        FILENAME ${binary_name}
        SOURCES ${target_sources} ${COMMON_SRC}
        COMPILE_DEFINITIONS ${target_definitions}
        COMPILE_OPTIONS ${args_COMPILE_OPTIONS}
        INCLUDE_DIRECTORIES ${target_include_directories}
        LINK_OPTIONS ${args_LINK_OPTIONS}
        LINKER_SCRIPT ${args_LINKER_SCRIPT}
        OPTIMIZATION ${args_OPTIMIZATION}
        OUTPUT_BIN_FILENAME main_bin_filename
        OUTPUT_HEX_FILENAME main_hex_filename
        OUTPUT_TARGET_NAME main_target_name
    )

    get_ch32_target_features(features "${CMAKE_CURRENT_SOURCE_DIR}" ${name})
    set_property(TARGET ${main_target_name} PROPERTY FEATURES ${features})
    set_property(TARGET ${main_target_name} PROPERTY SVD ${args_SVD})

    setup_firmware_target(${main_target_name} ${name} ${ARGN})
endfunction()
