include(gcc)

set(riscv_wch_triplet "riscv-wch-elf")

function(riscv_wch_gcc_check)
    gcc_get_version(version
        TRIPLET ${riscv_wch_triplet}
        PROGRAM_NAME prog
        PROGRAM_PATH prog_path
    )
    if(NOT version)
        message(FATAL_ERROR "could not find ${riscv_wch_triplet}-gcc in PATH. Please install the riscv-wch toolchain or add it to PATH.")
    endif()
    message("-- found ${prog} ${version} at ${prog_path}")
endfunction()

riscv_wch_gcc_check()
