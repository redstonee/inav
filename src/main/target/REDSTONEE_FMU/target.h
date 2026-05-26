/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#define TARGET_BOARD_IDENTIFIER "CUST"

#define USBD_PRODUCT_STRING  "REDSTONEE_FMU"

// *************** LED **********************
#define LED0                    PE5
#define LED1                    PE6
#define LED2                    PE4

// *************** SPI: Gyro & ACC & OSD **********************
#define USE_SPI
#define USE_SPI_DEVICE_1

#define SPI1_SCK_PIN        PA5
#define SPI1_MISO_PIN   	PA6
#define SPI1_MOSI_PIN   	PA7
#define SPI1_AF_SCK   	    GPIO_AF5
#define SPI1_AF_MISO   	    GPIO_AF5
#define SPI1_AF_MOSI   	    GPIO_AF5

#define USE_IMU_BMI088
#define IMU_BMI088_ALIGN        CW270_DEG
#define BMI088_SPI_BUS          BUS_SPI1
#define BMI088_GYRO_CS_PIN      PA4
#define BMI088_ACC_CS_PIN       PC4

// *************** UART *****************************
// #define USE_VCP

#define USE_UART2
#define UART2_RX_PIN            PA3
#define UART2_AF_RX             GPIO_AF7

#define USE_UART3
#define UART3_RX_PIN            PC11
#define UART3_TX_PIN            PC10
#define UART3_AF_RX             GPIO_AF7
#define UART3_AF_TX             GPIO_AF7

#define USE_UART4
#define UART4_RX_PIN            PF3
#define UART4_TX_PIN            PF4
#define UART4_AF_RX             GPIO_AF7
#define UART4_AF_TX             GPIO_AF7
#define INVERTER_PIN_UART4_RX   PE3

#define USE_UART5
#define UART5_RX_PIN            PF5
#define UART5_TX_PIN            PE0 
#define UART5_AF_RX             GPIO_AF4
#define UART5_AF_TX             GPIO_AF4

#define USE_UART6
#define UART6_RX_PIN            PA1
#define UART6_TX_PIN            PA0 
#define UART6_AF_RX             GPIO_AF8
#define UART6_AF_TX             GPIO_AF8

#define USE_UART7
#define UART7_RX_PIN            PB12
#define UART7_TX_PIN            PB13
#define UART7_AF_RX             GPIO_AF14
#define UART7_AF_TX             GPIO_AF14

#define SERIAL_PORT_COUNT       6

#define DEFAULT_RX_TYPE         RX_TYPE_SERIAL
#define SERIALRX_PROVIDER       SERIALRX_SBUS
#define SERIALRX_UART           SERIAL_PORT_USART4

// *************** I2C: BARO & MAG & RGB ****************************
#define USE_I2C
#define USE_I2C_DEVICE_1
#define USE_I2C_DEVICE_3
#define I2C1_SCL                PB6
#define I2C1_SDA                PB7
#define I2C1_AF_SDA             GPIO_AF4
#define I2C1_AF_SCL             GPIO_AF4

#define I2C3_SCL                PA14
#define I2C3_SDA                PA13
#define I2C3_AF_SDA             GPIO_AF7 
#define I2C3_AF_SCL             GPIO_AF7

#define USE_BARO
#define USE_BARO_SPL06
#define BARO_I2C_BUS            BUS_I2C3

#define USE_MAG

#ifdef REDSTONEE_FMU_EXTMAG
// External compass
#define MAG_I2C_BUS             BUS_I2C1
#else
// Onboard compass
#define MAG_I2C_BUS             BUS_I2C3
#endif
#define USE_MAG_ALL

// *************** ENABLE OPTICAL FLOW & RANGEFINDER *****************************
// #define USE_RANGEFINDER
// #define USE_RANGEFINDER_MSP
// #define USE_OPFLOW
// #define USE_OPFLOW_MSP

// *************** SDIO SD BLACKBOX*******************
// #define USE_SDCARD
// #define USE_SDCARD_SDIO
// #define SDCARD_SDIO_DEVICE      SDIODEV_1
// #define SDCARD_SDIO_4BIT
// #define ENABLE_BLACKBOX_LOGGING_ON_SDCARD_BY_DEFAULT

// *************** ADC *****************************
#define USE_ADC
#define ADC_INSTANCE                ADC1
#define ADC_CHANNEL_8_PIN           PB0
#define ADC_CHANNEL_9_PIN           PB1
#define VBAT_ADC_CHANNEL            ADC_CHN_9
#define CURRENT_METER_ADC_CHANNEL   ADC_CHN_8
#define VBAT_SCALE_DEFAULT          2121
#define CURRENT_METER_SCALE         402

#define DEFAULT_FEATURES        (FEATURE_VBAT | FEATURE_CURRENT_METER | FEATURE_OSD | FEATURE_TELEMETRY)

#define USE_DSHOT
#define USE_ESC_SENSOR
#define USE_SERIAL_4WAY_BLHELI_INTERFACE

#define TARGET_IO_PORTA 0xffff
#define TARGET_IO_PORTB 0xffff
#define TARGET_IO_PORTC 0xffff
#define TARGET_IO_PORTD 0xffff
#define TARGET_IO_PORTE 0xffff

#define MAX_PWM_OUTPUT_PORTS       6
