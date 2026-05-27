# INAV CH32H415REU6 Porting Notes

This folder is an isolated INAV copy for the CH32_UAV CH32H415REU6 flight
controller. It has moved past the initial placeholder scaffold, but it still
needs hardware bring-up before it should be treated as flight-ready.

## Current Build Status

- Target: `CH32H415REU6`
- Build directory: `build_ch32h415_ninja`
- Firmware artifacts:
  - `build_ch32h415_ninja/inav_9.0.1_CH32H415REU6_dual.hex` for flashing
    hardware from reset. This contains the V3F boot image at `0x00000000` and
    the INAV V5F image at `0x00010000`.
  - `build_ch32h415_ninja/inav_9.0.1_CH32H415REU6_dual.bin`
  - `build_ch32h415_ninja/inav_9.0.1_CH32H415REU6.hex`
  - `build_ch32h415_ninja/inav_9.0.1_CH32H415REU6.bin`
  - `build_ch32h415_ninja/bin/CH32H415REU6.elf`
- Latest local build succeeded after CMake reconfigure and Ninja rebuild.
- Latest memory use:
  - `FLASH: 177172 B / 184 KB`
  - `FLASH_CONFIG: 0 / 8 KB`
  - `RAM_CODE: 600 B / 128 KB`
  - `RAM_LOAD: 5872 B / 8 KB`
  - `RAM: 38252 B / 253440 B`

Build command used locally:

```powershell
$env:PATH='C:\msys64\usr\bin;C:\Users\30296\Desktop\CH32飞控\tools\wch-gcc\risc-none-embed-gcc-8.2.0\bin;' + $env:PATH
C:\msys64\usr\bin\cmake.exe -S . -B build_ch32h415_ninja -G Ninja -DTOOLCHAIN=riscv-none-elf -DCMAKE_TOOLCHAIN_FILE=cmake/riscv-none-elf.cmake -DCMAKE_BUILD_TYPE=Release
C:\msys64\usr\bin\cmake.exe --build build_ch32h415_ninja --target CH32H415REU6.dual -j 8
C:\msys64\usr\bin\cmake.exe --build build_ch32h415_ninja --target CH32H415REU6.bin -j 8
C:\msys64\usr\bin\cmake.exe --build build_ch32h415_ninja --target CH32H415REU6 -j 8
```

## Local Reference Files

- `references/wch/CH32H417DS0.PDF`
- `references/wch/CH32H417RM.PDF`
- `references/wch/QingKeV5_Processor_Manual.PDF`
- `references/wch/CH32H417EVT.ZIP`
- `references/wch/CH32H417EVT_expanded/`
- `references/jlceda/CH32_UAV_2026-05-10-15-19-17.zip`
- `references/HARDWARE_MAP_CH32_UAV.md`
- `lib/main/CH32H417/`
- Local schematic folder under `C:\Users\30296\Desktop\ch32`
- `C:\Users\30296\Desktop\pcb-a\.local\ch32_uav_online\CH32_UAV.epru`

Official WCH download pages used for the reference package:

- `https://www.wch.cn/downloads/CH32H417DS0_PDF.html`
- `https://www.wch.cn/downloads/CH32H417RM_PDF.html`
- `https://www.wch.cn/downloads/QingKeV5_Processor_Manual_PDF.html`
- `https://www.wch.cn/downloads/CH32H417EVT_ZIP.html`

## Current Hardware Mapping

- MCU: CH32H415REU6 through WCH CH32H417/H416/H415 shared headers.
- HSE: 25 MHz.
- IMU: BMI088 on SPI1, PA5 SCK, PA6 MISO, PA7 MOSI, PA4 gyro CS, PC4 accel CS.
- Baro: SPL06 on PA14/PA13 software I2C, address 0x76.
- Mag: IST8310 on the same software I2C bus.
- UARTs: USART2 PA2/PA3, USART3 PC10/PC11, USART4 PF4/PF3, USART5 PE0/PF5,
  USART6 PA0/PA1, USART7 PB13/PB12.
- Receiver default: SBUS on USART4 with PE3 controlling the RX inverter.
- PWM: PA10, PA9, PC9, PC6, PC7, PC8.
- ADC: PB1 VBAT, PB0 current sense. VBAT divider is 20k/1k, so default scale
  is 2100.
- ISENS comes through R4=1K into PB0, with D2
  clamping to GND. The actual current scale depends on the connected power/ESC
  board output, not only this FMU schematic.
- First-boot default config: USB VCP MSP, USART2 MSP at 115200, USART6 MSP at
  115200, USART4 SBUS RX, multirotor
  platform, Quad X motor mixer on PWM1-PWM4. PWM5/PWM6 remain available for
  later mixer changes through MSP/INAV Configurator.
- The schematic annotation labels UART2 as ESC, but USART2 is currently kept as
  a fallback MSP configurator port while USB VCP is being hardware-tested.

## What Is Implemented

- RISC-V toolchain entry: `cmake/riscv-none-elf.cmake`.
- CH32 platform CMake entry: `cmake/ch32.cmake`, `cmake/ch32h417.cmake`.
- WCH V5F startup/linker/peripheral-library integration.
- Minimal V3F boot image that configures the WCH 25 MHz HSE clock tree and
  wakes the V5F INAV image at `0x00010000`.
- CH32 GPIO/RCC/SysTick reset-time bring-up.
- CH32 SPI driver using WCH StdPeriph.
- CH32 interrupt-driven UART driver.
- CH32 timer/PWM implementation for normal PWM outputs and input capture.
- CH32 ADC1 + DMA1 channel 1 sampling for INAV ADC channels.
- CH32 internal flash-backed config storage with an 8 KiB V5F flash reserve.
- CH32 USBFS CDC ACM VCP for MSP/INAV Configurator.
- New target: `src/main/target/CH32H415REU6`.
- Target default configuration: `src/main/target/CH32H415REU6/config.c`.

## Deliberately Disabled

- SDIO/blackbox: SDMMC and filesystem glue are not yet implemented.
- DShot and ESC sensor: timer DMA path is not validated.
- Hardware I2C3 on PA13/PA14: using software I2C until AF timing is verified.
- AW2023 RGB LED: INAV has no local driver and it is not flight-critical.
- GPS and CLI: disabled in this flash-constrained bring-up build. MSP over
  USART2 remains enabled for Configurator access.

## Major Remaining Work

- Validate SPI BMI088 detection and set the correct `IMU_BMI088_ALIGN`.
- Confirm the default Quad X motor order against the actual frame wiring, or
  replace it with the final mixer in Configurator.
- Validate USART AF mappings for USART5/6/7 on this exact package.
- Validate PWM timer output polarity and motor order on a scope.
- Measure current sensor scale/offset for PB0.
- Validate CH32 flash config erase/write on hardware before relying on saved
  settings for flight.
- Port USB VCP if configurator access over USB is required.
- Add SDIO/blackbox support if onboard logging is required.
- Add timer DMA/DShot only after normal PWM flight is proven.

## What I Still Need From Hardware Testing

- A power/ESC board current-sense transfer value, or measured PB0 voltage per
  amp, so `current.scale` can be set correctly.
- Bench result for BMI088 orientation: level attitude and pitch/roll/yaw signs.
- Scope/logic-analyzer result for PWM1-PWM6 order and polarity.
- Confirmation that USART2 can connect to INAV Configurator at 115200 after
  flashing, and that USART4 receives SBUS with PE3 inverter control.
- Confirmation that saved settings survive reboot, proving the internal flash
  config page layout on real CH32H415REU6 silicon.

## Build Note

The CMake toolchain now auto-detects `riscv-none-elf-` or WCH's
`riscv-none-embed-` prefix. WCH's toolchain is preferred because the startup and
interrupt attributes use QingKe extensions such as
`interrupt("WCH-Interrupt-fast")` and the `rv32imacxw` ISA string.

Local smoke validation was done with WCH `riscv-none-embed-gcc` from the earlier
CH32 LED bring-up project, MSYS2 CMake/Ninja, and MSYS2 Ruby for the settings
generator.
