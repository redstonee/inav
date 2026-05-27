/*
 * Default board configuration for the CH32_UAV CH32H415REU6 target.
 *
 * Keep this limited to safe first-boot defaults. Users can still change the
 * mixer, ports, and receiver settings through MSP/INAV Configurator.
 */

#include <stdint.h>

#include "platform.h"

#include "fc/config.h"

#include "flight/mixer.h"
#include "flight/mixer_profile.h"

#include "io/serial.h"
#include "sensors/gyro.h"

void targetConfiguration(void)
{
    const int usbMspPort = findSerialPortIndexByIdentifier(SERIAL_PORT_USB_VCP);
    if (usbMspPort >= 0) {
        serialConfigMutable()->portConfigs[usbMspPort].functionMask = FUNCTION_MSP;
        serialConfigMutable()->portConfigs[usbMspPort].msp_baudrateIndex = BAUD_115200;
    }

    const int uartMspPort = findSerialPortIndexByIdentifier(SERIAL_PORT_USART2);
    if (uartMspPort >= 0) {
        serialConfigMutable()->portConfigs[uartMspPort].functionMask = FUNCTION_MSP;
        serialConfigMutable()->portConfigs[uartMspPort].msp_baudrateIndex = BAUD_115200;
    }

    const int uart6MspPort = findSerialPortIndexByIdentifier(SERIAL_PORT_USART6);
    if (uart6MspPort >= 0) {
        serialConfigMutable()->portConfigs[uart6MspPort].functionMask = FUNCTION_MSP;
        serialConfigMutable()->portConfigs[uart6MspPort].msp_baudrateIndex = BAUD_115200;
    }

    const int rxPort = findSerialPortIndexByIdentifier(SERIAL_PORT_USART4);
    if (rxPort >= 0) {
        serialConfigMutable()->portConfigs[rxPort].functionMask = FUNCTION_RX_SERIAL;
    }

    mixerConfigMutable()->platformType = PLATFORM_MULTIROTOR;
    gyroConfigMutable()->looptime = 4000;

    *primaryMotorMixerMutable(0) = (motorMixer_t){ 1.0f, -1.0f,  1.0f, -1.0f }; // rear right
    *primaryMotorMixerMutable(1) = (motorMixer_t){ 1.0f, -1.0f, -1.0f,  1.0f }; // front right
    *primaryMotorMixerMutable(2) = (motorMixer_t){ 1.0f,  1.0f,  1.0f,  1.0f }; // rear left
    *primaryMotorMixerMutable(3) = (motorMixer_t){ 1.0f,  1.0f, -1.0f, -1.0f }; // front left
}
