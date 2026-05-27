/*
 * CH32_UAV flight-controller target for WCH CH32H415REU6.
 *
 * Pinout is taken from the local JLCEDA CH32_UAV project and schematic
 * net names. Keep high-risk peripherals disabled until the matching CH32
 * low-level driver has been validated on hardware.
 */

#pragma once

#define TARGET_BOARD_IDENTIFIER "H415"
#define USBD_PRODUCT_STRING "CH32H415REU6"

#define EEPROM_SIZE 8192
#define USE_TARGET_CONFIG

// *************** SPI1: BMI088 gyro/accelerometer ***********************
#define USE_SPI
#define USE_SPI_DEVICE_1
#define SPI1_SCK_PIN            PA5
#define SPI1_MISO_PIN           PA6
#define SPI1_MOSI_PIN           PA7

#define USE_IMU_BMI088
#define IMU_BMI088_ALIGN        CW0_DEG
#define BMI088_SPI_BUS          BUS_SPI1
#define BMI088_GYRO_CS_PIN      PA4
#define BMI088_ACC_CS_PIN       PC4

// *************** I2C3 net: SPL06, IST8310, AW2023 **********************
// CH32 hardware I2C AF for PA13/PA14 still needs bench validation, so use
// the existing software I2C bus for first hardware bring-up.
#define USE_I2C
#define USE_I2C_DEVICE_EMULATED
#define SOFT_I2C
#define SOFT_I2C_SCL            PA14
#define SOFT_I2C_SDA            PA13
#define DEFAULT_I2C_BUS         BUS_I2C_EMULATED

#define USE_BARO
#define USE_BARO_SPL06
#define BARO_I2C_BUS            DEFAULT_I2C_BUS
#define SPL06_I2C_ADDR          0x76

#define USE_MAG
#define USE_MAG_IST8310
#define MAG_I2C_BUS             DEFAULT_I2C_BUS

// *************** External I2C2 connector, not enabled yet **************
#define I2C2_SCL                PB6
#define I2C2_SDA                PB7

// *************** UARTs / USB VCP ***************************************
// USBFS PA11/PA12 is the primary MSP configurator port. USART2 is kept as
// a 115200 MSP fallback and USART4 is the default inverted serial receiver.
#define USE_VCP

#define USE_UART2
#define UART2_TX_PIN            PA2
#define UART2_RX_PIN            PA3

#define USE_UART3
#define UART3_TX_PIN            PC10
#define UART3_RX_PIN            PC11

#define USE_UART4
#define UART4_TX_PIN            PF4
#define UART4_RX_PIN            PF3

#define USE_UART5
#define UART5_TX_PIN            PE0
#define UART5_RX_PIN            PF5

#define USE_UART6
#define UART6_TX_PIN            PA0
#define UART6_RX_PIN            PA1

#define USE_UART7
#define UART7_TX_PIN            PB13
#define UART7_RX_PIN            PB12

#define SERIAL_PORT_COUNT       7

#define DEFAULT_RX_TYPE         RX_TYPE_SERIAL
#define SERIALRX_PROVIDER       SERIALRX_SBUS
#define SERIALRX_UART           SERIAL_PORT_USART4
#define USE_UART_INVERTER
#define INVERTER_PIN_UART4_RX   PE3

// *************** ADC: VBAT and current sense ****************************
#define USE_ADC
#define ADC_CHANNEL_1_PIN       PB1
#define VBAT_ADC_CHANNEL        ADC_CHN_1
#define ADC_CHANNEL_2_PIN       PB0
#define CURRENT_METER_ADC_CHANNEL ADC_CHN_2

// VBAT divider is R5=20k / R26=1k in the CH32_UAV schematic.
#define VBAT_SCALE_DEFAULT      2100

// *************** Known but intentionally disabled for first PWM build ***
#undef USE_BLACKBOX
#undef USE_SDCARD
#undef USE_DSHOT
#undef USE_ESC_SENSOR
#undef USE_SERIAL_4WAY_BLHELI_INTERFACE
#define DISABLE_MSP_DISPLAYPORT_FALLBACK
#define DISABLE_MSP_SENSOR_FALLBACKS

// Common INAV feature set is trimmed for the CH32 bring-up target.
// GPS is disabled for the first flash-constrained PWM bring-up build.
#undef USE_SERIALRX_CRSF
#undef USE_SERIALRX_FPORT
#undef USE_SERIALRX_FPORT2
#undef USE_SERIALRX_GHST
#undef USE_SERIALRX_IBUS
#undef USE_SERIALRX_JETIEXBUS
#undef USE_SERIALRX_MAVLINK
#undef USE_SERIALRX_SPEKTRUM
#undef USE_SERIALRX_SRXL2
#undef USE_SERIALRX_SUMD
#undef USE_RX_MSP
#undef USE_MSP_RC_OVERRIDE
#undef USE_SERIAL_PASSTHROUGH
#undef USE_SERVO_SBUS
#undef USE_SPEKTRUM_CMS_TELEMETRY
#undef USE_SPEKTRUM_VTX_TELEMETRY
#undef USE_GPS
#undef USE_GPS_PROTO_UBLOX
#undef USE_GPS_PROTO_MSP
#undef USE_GPS_FIX_ESTIMATION
#undef USE_WIND_ESTIMATOR
#undef USE_ADSB
#undef USE_PITOT
#undef USE_PITOT_ADC
#undef USE_PITOT_MS4525
#undef USE_PITOT_MSP
#undef USE_PITOT_DLVR
#undef USE_PITOT_VIRTUAL
#undef USE_RANGEFINDER
#undef USE_RANGEFINDER_MSP
#undef USE_RANGEFINDER_BENEWAKE
#undef USE_RANGEFINDER_VL53L0X
#undef USE_RANGEFINDER_VL53L1X
#undef USE_RANGEFINDER_US42
#undef USE_RANGEFINDER_TOF10120_I2C
#undef USE_RANGEFINDER_TERARANGER_EVO_I2C
#undef USE_RANGEFINDER_USD1_V0
#undef USE_RANGEFINDER_NANORADAR
#undef USE_OPFLOW
#undef USE_OPFLOW_CXOF
#undef USE_OPFLOW_MSP
#undef USE_TELEMETRY
#undef USE_TELEMETRY_LTM
#undef USE_TELEMETRY_SIM
#undef USE_TELEMETRY_MAVLINK
#undef USE_TELEMETRY_SRXL
#undef USE_TELEMETRY_GHST
#undef USE_TELEMETRY_IBUS
#undef USE_TELEMETRY_SMARTPORT
#undef USE_TELEMETRY_CRSF
#undef USE_TELEMETRY_JETIEXBUS
#undef USE_MSP_OVER_TELEMETRY
#undef USE_I2C_IO_EXPANDER
#undef USE_OSD
#undef USE_FRSKYOSD
#undef USE_DJI_HD_OSD
#undef USE_MSP_OSD
#undef USE_MSP_DISPLAYPORT
#undef USE_CMS_FONT_PREVIEW
#undef USE_LED_STRIP
#undef USE_DASHBOARD
#undef USE_OLED_UG2864
#undef USE_1WIRE
#undef USE_1WIRE_DS2482
#undef USE_TEMPERATURE_SENSOR
#undef USE_TEMPERATURE_LM75
#undef USE_TEMPERATURE_DS18B20
#undef USE_VTX_COMMON
#undef USE_VTX_CONTROL
#undef USE_VTX_SMARTAUDIO
#undef USE_VTX_TRAMP
#undef USE_VTX_MSP
#undef USE_SERIAL_GIMBAL
#undef USE_HEADTRACKER
#undef USE_HEADTRACKER_SERIAL
#undef USE_HEADTRACKER_MSP
#undef USE_CMS
#undef CMS_MENU_OSD
#undef USE_EXTENDED_CMS_MENUS
#define DISABLE_CLI
#undef USE_SIMULATOR
#undef USE_FAKE_BATT_SENSOR
#undef USE_DYNAMIC_FILTERS
#undef USE_ADAPTIVE_FILTER
#undef USE_GYRO_KALMAN
#undef USE_SMITH_PREDICTOR
#undef USE_RATE_DYNAMICS
#undef USE_D_BOOST
#undef USE_ANTIGRAVITY
#undef USE_MR_BRAKING_MODE
#undef USE_POWER_LIMITS
#undef USE_SAFE_HOME
#undef USE_FW_AUTOLAND
#undef USE_AUTOTUNE_FIXED_WING
#undef USE_PROGRAMMING_FRAMEWORK
#undef USE_CLI_BATCH
#undef USE_EZ_TUNE
#undef USE_LOG
#undef USE_STATS
#undef USE_RCDEVICE
#undef USE_MULTI_MISSION
#undef USE_MULTI_FUNCTIONS
#undef NAV_NON_VOLATILE_WAYPOINT_CLI
#undef NAV_NON_VOLATILE_WAYPOINT_STORAGE
#undef NAV_MAX_WAYPOINTS
#define NAV_MAX_WAYPOINTS      8

#define DEFAULT_FEATURES (COMMON_DEFAULT_FEATURES | FEATURE_VBAT)

#define SENSORS_SET (SENSOR_ACC | SENSOR_BARO | SENSOR_MAG)

#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         0xffff
#define TARGET_IO_PORTD         0x0000
#define TARGET_IO_PORTE         0xffff
#define TARGET_IO_PORTF         0xffff

#define MAX_PWM_OUTPUT_PORTS    6
#define TARGET_MOTOR_COUNT      6
