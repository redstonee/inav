set(CH32H417_DIR "${MAIN_LIB_DIR}/main/CH32H417")

set(CH32_RISCV_ARCH "rv32imafcxw" CACHE STRING "RISC-V ISA string for WCH QingKe V5F")
set(CH32_RISCV_ABI "ilp32f" CACHE STRING "RISC-V ABI for WCH QingKe V5F")

set(CH32_V5F_COMMON_OPTIONS
    -march=${CH32_RISCV_ARCH}
    -mabi=${CH32_RISCV_ABI}
    -msave-restore
)

set(CH32_V3F_COMMON_OPTIONS
    -march=rv32imac
    -mabi=ilp32
    -msave-restore
)

set(CH32H417_INCLUDE_DIRS
    "${CH32H417_DIR}/Core"
    "${CH32H417_DIR}/Debug"
    "${CH32H417_DIR}/Config"
    "${CH32H417_DIR}/Peripheral/inc"
    "${CH32H417_DIR}/System/V5F"
)

set(CH32H417_STDPERIPH_SRC
    "${CH32H417_DIR}/Core/core_riscv.c"
    "${CH32H417_DIR}/Debug/debug.c"
    "${CH32H417_DIR}/System/V5F/system_ch32h417.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_adc.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_dbgmcu.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_dma.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_exti.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_flash.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_gpio.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_i2c.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_pwr.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_rcc.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_spi.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_tim.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_usart.c"
)

set(CH32H417_V3F_BOOT_SRC
    "${CH32H417_DIR}/Core/core_riscv.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_flash.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_gpio.c"
    "${CH32H417_DIR}/Peripheral/src/ch32h417_rcc.c"
    "${MAIN_DIR}/references/wch/CH32H417EVT_expanded/EVT/EXAM/USBFS/DEVICE/SimulateCDC/V3F/User/system_ch32h417.c"
)

main_sources(CH32H417_INAV_SRC
    config/config_streamer_ch32h417.c
    config/config_streamer_ram.c
    drivers/adc_ch32h417.c
    drivers/bus_spi_ch32h417.c
    drivers/serial_uart.c
    drivers/serial_uart_ch32h417.c
    drivers/serial_usb_vcp_ch32h417.c
    drivers/system_ch32h417.c
    drivers/timer_ch32h417.c
    drivers/timer_impl_ch32h417.c
    drivers/usb_io.c
    drivers/uart_inverter.c
)

function(add_ch32h415_dual_image_target target_name v3f_bin_target v3f_bin v5f_bin_target v5f_bin)
    if(NOT CH32_PYTHON_INTERPRETER)
        message(FATAL_ERROR "Python is required to generate the CH32H415 dual-core image")
    endif()

    string(TOLOWER ${PROJECT_NAME} lowercase_project_name)
    set(binary_name ${lowercase_project_name}_${FIRMWARE_VERSION}_${target_name})
    if(DEFINED BUILD_SUFFIX AND NOT "" STREQUAL "${BUILD_SUFFIX}")
        set(binary_name "${binary_name}_${BUILD_SUFFIX}")
    endif()

    set(dual_bin "${CMAKE_BINARY_DIR}/${binary_name}_dual.bin")
    set(dual_hex "${CMAKE_BINARY_DIR}/${binary_name}_dual.hex")
    set(dual_target ${target_name}.dual)

    add_custom_target(${dual_target} ALL
        ${CH32_PYTHON_INTERPRETER}
            "${MAIN_DIR}/tools/ch32_make_dual_image.py"
            --v3f-bin "${v3f_bin}"
            --v5f-bin "${v5f_bin}"
            --v5f-offset 0x10000
            --out-bin "${dual_bin}"
            --out-hex "${dual_hex}"
        BYPRODUCTS "${dual_bin}" "${dual_hex}"
        COMMENT "Generating CH32H415 dual-core image ${dual_hex}"
        VERBATIM
    )
    add_dependencies(${dual_target} ${v3f_bin_target} ${v5f_bin_target})
endfunction()

set(CH32H417_DEFINITIONS
    CH32H417
    CH32H415
    Core_V5F
    USE_STDPERIPH_DRIVER
)

function(target_ch32h415reu6 name)
    if(NOT TOOLCHAIN STREQUAL "riscv-none-elf")
        return()
    endif()

    target_ch32(
        NAME ${name}
        STARTUP "${CH32H417_DIR}/Startup/startup_ch32h417_v5f.S"
        SOURCES ${CH32H417_STDPERIPH_SRC} ${CH32H417_INAV_SRC}
        COMPILE_DEFINITIONS ${CH32H417_DEFINITIONS} CH32H415REU6 MCU_FLASH_SIZE=256
        COMPILE_OPTIONS ${CH32_V5F_COMMON_OPTIONS}
        INCLUDE_DIRECTORIES ${CH32H417_INCLUDE_DIRS}
        LINK_OPTIONS ${CH32_V5F_COMMON_OPTIONS}
        LINKER_SCRIPT "V5F/Link_v5f.ld"
        OPTIMIZATION -Os
        HSE_MHZ 25
        ${ARGN}
    )

    string(TOLOWER ${PROJECT_NAME} lowercase_project_name)
    set(binary_name ${lowercase_project_name}_${FIRMWARE_VERSION}_${name})
    if(DEFINED BUILD_SUFFIX AND NOT "" STREQUAL "${BUILD_SUFFIX}")
        set(binary_name "${binary_name}_${BUILD_SUFFIX}")
    endif()
    set(v5f_bin "${CMAKE_BINARY_DIR}/${binary_name}.bin")

    set(v3f_boot_name ${name}_V3F_BOOT)
    set(v3f_boot_binary_name "${binary_name}_v3f_boot")
    add_ch32_executable(
        NAME ${v3f_boot_name}
        FILENAME ${v3f_boot_binary_name}
        SOURCES "${CH32H417_DIR}/Startup/startup_ch32h417_v3f.S" "${CH32H417_DIR}/Boot/ch32h415_v3f_boot.c" ${CH32H417_V3F_BOOT_SRC}
        COMPILE_DEFINITIONS CH32H417 CH32H415 CH32H415REU6 Core_V3F USE_STDPERIPH_DRIVER HSE_VALUE=25000000
        COMPILE_OPTIONS ${CH32_V3F_COMMON_OPTIONS}
        INCLUDE_DIRECTORIES ${CH32H417_INCLUDE_DIRS}
        LINK_OPTIONS ${CH32_V3F_COMMON_OPTIONS}
        LINKER_SCRIPT "V3F/Link_v3f.ld"
        OPTIMIZATION -Os
        OUTPUT_BIN_FILENAME v3f_bin
    )

    add_ch32h415_dual_image_target(${name} ${v3f_boot_name}.bin "${v3f_bin}" ${name}.bin "${v5f_bin}")
endfunction()
