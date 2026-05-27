include(gcc)

set(riscv_toolchain_triplets riscv-none-elf riscv-none-embed)

function(riscv_none_elf_gcc_check)
    foreach(triplet ${riscv_toolchain_triplets})
        gcc_get_version(version
            TRIPLET ${triplet}
            PROGRAM_NAME prog
            PROGRAM_PATH prog_path
        )
        if(version)
            message("-- found ${prog} ${version} at ${prog_path}")
            return()
        endif()
    endforeach()

    message("-- could not find riscv-none-elf-gcc or riscv-none-embed-gcc; install WCH RISC-V GCC or add it to PATH before building CH32 targets")
endfunction()

riscv_none_elf_gcc_check()
