include(rv32imafc)
# include(stm32f4-usb)

set(CH32H4_STDPERIPH_DIR "${MAIN_LIB_DIR}/main/CH32H4/CH32H41x_Driver/Peripheral")
set(CH32H4_CORE_DIR "${MAIN_LIB_DIR}/main/CH32H4/CH32H41x_Driver/Core")
set(CH32H4_DEVICE_DIR "${MAIN_LIB_DIR}/main/CH32H4/CH32H41x_Driver/Device")
# set(CH32H4_VCP_DIR "${MAIN_SRC_DIR}/vcpf4")

set(CH32H4_STDPERIPH_SRC_EXCLUDES
    ch32h417_can.c
    ch32h417_ecdc.c
    ch32h417_crc.c
    ch32h417_dbgmcu.c
    ch32h417_dvp.c
    ch32h417_eth.c
    ch32h417_fmc.c
    ch32h417_lptim.c
    ch32h417_qspi.c
    ch32h417_sai.c
    ch32h417_serdes.c
)

set(CH32H4_STDPERIPH_SRC_DIR "${CH32H4_STDPERIPH_DIR}/src")
glob_except(CH32H4_STDPERIPH_SRC "${CH32H4_STDPERIPH_SRC_DIR}/*.c" "${CH32H4_STDPERIPH_SRC_EXCLUDES}")

# The startup argument only accept 1 file,
# so we need to add the other one to the sources
main_sources(CH32H4_V5F_STARTUP_SRC
    startup/startup_ch32h417_v5f.S
)

main_sources(CH32H4_SRC
    target/system_ch32h417.c

    config/config_streamer_ch32h4.c
    config/config_streamer_ram.c
    config/config_streamer_extflash.c

    drivers/adc_ch32h41x.c
    drivers/adc_ch32h41x.c
    drivers/bus_i2c_ch32h41x.c
    drivers/bus_spi_ch32h41x.c
    drivers/serial_uart_ch32h41x.c
    drivers/system_ch32h41x.c
    drivers/timer.c
    drivers/timer_impl_stdperiph.c
    drivers/timer_ch32h41x.c
    drivers/uart_inverter.c
    drivers/dma_ch32h41x.c
    # drivers/sdcard/sdmmc_sdio_ch32h41x.c
)

# set(CH32H4_VCP_SRC
#     ch32f4xx_it.c
#     usb_bsp.c
#     usbd_desc.c
#     usbd_usr.c
#     usbd_cdc_vcp.c
# )
# list(TRANSFORM CH32H4_VCP_SRC PREPEND "${CH32H4_VCP_DIR}/")

# main_sources(CH32H4_MSC_SRC
#     drivers/usb_msc_f4xx.c
# )

set(CH32H4_INCLUDE_DIRS
    "${CMSIS_DSP_INCLUDE_DIR}"
    "${CH32H4_STDPERIPH_DIR}/inc"
    "${CH32H4_DEVICE_DIR}"
    # "${CH32H4_VCP_DIR}"
)

set(CH32H4_DEFINITIONS
    ${RV32IMAFC_DEFINITIONS}
    CH32H4
    MCU_FLASH_SIZE=960
    USE_STDPERIPH_DRIVER
)

function(target_ch32h41x name)
    target_ch32(
        NAME ${name}
        SOURCES ${CH32H4_SRC} ${CH32H4_STDPERIPH_SRC} ${CH32H4_V5F_STARTUP_SRC} ${CH32H4_CORE_DIR}/core_riscv.c ${CH32H4_DEVICE_DIR}/bringup.c
        COMPILE_DEFINITIONS ${CH32H4_DEFINITIONS}
        COMPILE_OPTIONS ${RV32IMAFC_COMMON_OPTIONS} ${RV32IMAFC_COMPILE_OPTIONS}
        INCLUDE_DIRECTORIES ${CH32H4_INCLUDE_DIRS} ${CH32H4_CORE_DIR}

        # MSC_SOURCES ${CH32H4_USBMSC_SRC} ${CH32H4_MSC_SRC}
        # VCP_SOURCES ${CH32H4_USB_SRC} ${CH32H4_VCP_SRC}
        # VCP_INCLUDE_DIRECTORIES ${CH32H4_USB_INCLUDE_DIRS}

        STARTUP startup_ch32h417_v3f.S

        LINK_OPTIONS ${RV32IMAFC_COMMON_OPTIONS} ${RV32IMAFC_LINK_OPTIONS}
        LINKER_SCRIPT ch32_flash_h41xE

        OPTIMIZATION -O2

        OPENOCD_TARGET ch32h41x

        ${ARGN}
    )
endfunction()

set(CH32H417_COMPILE_DEFINITIONS
    CH32H417xx
)
