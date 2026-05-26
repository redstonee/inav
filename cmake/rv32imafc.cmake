set(RV32IMAFC_COMMON_OPTIONS
    -march=rv32imafc_zba_zbb_zbc_zbs_xw
    -mabi=ilp32f
    -msmall-data-limit=8
    -msave-restore
    -fsigned-char
    -mcmodel=medany
    -Wno-comment
)

set(RV32IMAFC_COMPILE_OPTIONS
)

set(RV32IMAFC_LINK_OPTIONS
)

set(RV32IMAFC_DEFINITIONS
    __FPU_PRESENT=1
)
