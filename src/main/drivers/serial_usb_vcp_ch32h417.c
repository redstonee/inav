/*
 * CH32H417/H415 USBFS CDC ACM serial port support.
 */

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "platform.h"

#ifdef USE_VCP

#include "build/build_config.h"

#include "common/utils.h"
#include "drivers/io.h"
#include "drivers/nvic.h"
#include "drivers/serial.h"
#include "drivers/serial_usb_vcp.h"
#include "drivers/time.h"
#include "drivers/usb_io.h"

#define USB_TIMEOUT_MS             50
#define USB_EP0_SIZE               64
#define USB_FS_PACKET_SIZE         64
#define USB_CDC_NOTIFY_SIZE        8
#define USB_RX_BUFFER_SIZE         2048
#define USB_RX_BUFFER_MASK         (USB_RX_BUFFER_SIZE - 1)

#define EP_IN                      0x80
#define EP_OUT                     0x00
#define EP0                        0x00
#define EP1                        0x01
#define EP2                        0x02
#define EP3                        0x03

#define USBFSD_UEP_MOD_BASE        0x4002340C
#define USBFSD_UEP_CTL_BASE        0x40023432
#define USBFSD_UEP_TX_CTRL(n)      (*((volatile uint8_t *)(USBFSD_UEP_CTL_BASE + (n) * 0x04)))
#define USBFSD_UEP_RX_CTRL(n)      (*((volatile uint8_t *)(USBFSD_UEP_CTL_BASE + (n) * 0x04 + 1)))

typedef struct __attribute__((packed)) {
    uint32_t bitrate;
    uint8_t stopBits;
    uint8_t parity;
    uint8_t dataBits;
} cdcLineCoding_t;

static vcpPort_t vcpPort;

static const uint8_t *ep0DataPtr;
static volatile uint16_t ep0DataRemaining;
static volatile uint8_t setupRequest;
static volatile uint16_t setupValue;
static volatile uint16_t setupLength;
static volatile uint8_t deviceAddress;
static volatile uint8_t deviceConfigured;
static volatile uint8_t deviceSleepStatus;
static volatile bool setAddressPending;
static volatile bool txBusy;
static volatile uint16_t controlLineState;

static cdcLineCoding_t lineCoding = {
    .bitrate = 115200,
    .stopBits = 0,
    .parity = 0,
    .dataBits = 8,
};

static volatile uint16_t rxHead;
static volatile uint16_t rxTail;
static volatile bool rxFlowStopped;

static uint8_t rxBuffer[USB_RX_BUFFER_SIZE];

static __attribute__((aligned(4))) uint8_t ep0Buffer[USB_EP0_SIZE];
static __attribute__((aligned(4))) uint8_t ep1NotifyBuffer[USB_CDC_NOTIFY_SIZE];
static __attribute__((aligned(4))) uint8_t ep2OutBuffer[USB_FS_PACKET_SIZE];
static __attribute__((aligned(4))) uint8_t ep3InBuffer[USB_FS_PACKET_SIZE];

static const uint8_t deviceDescriptor[] = {
    0x12,       // bLength
    0x01,       // bDescriptorType: Device
    0x00, 0x02, // bcdUSB 2.00
    0x02,       // bDeviceClass: CDC
    0x00,       // bDeviceSubClass
    0x00,       // bDeviceProtocol
    USB_EP0_SIZE,
    0x86, 0x1A, // idVendor: WCH
    0x0C, 0xFE, // idProduct: WCH USB CDC sample PID
    0x01, 0x00, // bcdDevice
    0x01,       // iManufacturer
    0x02,       // iProduct
    0x03,       // iSerialNumber
    0x01,       // bNumConfigurations
};

static const uint8_t configDescriptor[] = {
    0x09, 0x02, 0x43, 0x00, 0x02, 0x01, 0x00, 0x80, 0x32,

    0x09, 0x04, 0x00, 0x00, 0x01, 0x02, 0x02, 0x01, 0x00,
    0x05, 0x24, 0x00, 0x10, 0x01,
    0x05, 0x24, 0x01, 0x00, 0x01,
    0x04, 0x24, 0x02, 0x02,
    0x05, 0x24, 0x06, 0x00, 0x01,
    0x07, 0x05, 0x81, 0x03, USB_CDC_NOTIFY_SIZE, 0x00, 0x10,

    0x09, 0x04, 0x01, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x00,
    0x07, 0x05, 0x02, 0x02, USB_FS_PACKET_SIZE, 0x00, 0x00,
    0x07, 0x05, 0x83, 0x02, USB_FS_PACKET_SIZE, 0x00, 0x00,
};

static const uint8_t langStringDescriptor[] = {
    0x04, 0x03, 0x09, 0x04,
};

static const uint8_t manufacturerStringDescriptor[] = {
    0x08, 0x03, 'W', 0, 'C', 0, 'H', 0,
};

static const uint8_t productStringDescriptor[] = {
    0x24, 0x03,
    'C', 0, 'H', 0, '3', 0, '2', 0, 'H', 0, '4', 0,
    '1', 0, '5', 0, 'R', 0, 'E', 0, 'U', 0, '6', 0,
    ' ', 0, 'I', 0, 'N', 0, 'A', 0, 'V', 0,
};

static const uint8_t serialStringDescriptor[] = {
    0x1A, 0x03,
    'C', 0, 'H', 0, '3', 0, '2', 0, 'H', 0, '4', 0,
    '1', 0, '5', 0, '0', 0, '0', 0, '0', 0, '1', 0,
};

static uint16_t min16(uint16_t a, uint16_t b)
{
    return a < b ? a : b;
}

static uint16_t rxBytesAvailable(void)
{
    return (rxHead - rxTail) & USB_RX_BUFFER_MASK;
}

static bool rxHasPacketRoom(void)
{
    return rxBytesAvailable() < (USB_RX_BUFFER_SIZE - USB_FS_PACKET_SIZE - 1);
}

static void usbRxEndpointMaybeResume(void)
{
    if (rxFlowStopped && rxHasPacketRoom()) {
        USBFSD->UEP2_RX_CTRL = (USBFSD->UEP2_RX_CTRL & ~USBFS_UEP_R_RES_MASK) | USBFS_UEP_R_RES_ACK;
        rxFlowStopped = false;
    }
}

static bool usbIsConfigured(void)
{
    return deviceConfigured != 0;
}

static void ep0PrepareTx(const uint8_t *data, uint16_t len)
{
    const uint16_t txLen = min16(len, USB_EP0_SIZE);

    if (txLen > 0) {
        memcpy(ep0Buffer, data, txLen);
    }

    ep0DataPtr = data + txLen;
    ep0DataRemaining = len - txLen;
    USBFSD->UEP0_TX_LEN = txLen;
    USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_TOG | USBFS_UEP_T_RES_ACK;
}

static void ep0StatusIn(void)
{
    ep0DataPtr = NULL;
    ep0DataRemaining = 0;
    USBFSD->UEP0_TX_LEN = 0;
    USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_TOG | USBFS_UEP_T_RES_ACK;
}

static void ep0Stall(void)
{
    USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_TOG | USBFS_UEP_T_RES_STALL;
    USBFSD->UEP0_RX_CTRL = USBFS_UEP_R_TOG | USBFS_UEP_R_RES_STALL;
}

static bool endpointHalt(uint8_t ep, bool halt)
{
    const uint8_t txState = halt ? USBFS_UEP_T_RES_STALL : USBFS_UEP_T_RES_NAK;
    const uint8_t rxState = halt ? USBFS_UEP_R_RES_STALL : USBFS_UEP_R_RES_ACK;

    switch (ep) {
    case EP_IN | EP1:
        USBFSD->UEP1_TX_CTRL = (USBFSD->UEP1_TX_CTRL & ~USBFS_UEP_T_RES_MASK) | txState;
        return true;
    case EP_OUT | EP2:
        USBFSD->UEP2_RX_CTRL = (USBFSD->UEP2_RX_CTRL & ~USBFS_UEP_R_RES_MASK) | rxState;
        rxFlowStopped = false;
        return true;
    case EP_IN | EP3:
        USBFSD->UEP3_TX_CTRL = (USBFSD->UEP3_TX_CTRL & ~USBFS_UEP_T_RES_MASK) | txState;
        txBusy = false;
        return true;
    default:
        return false;
    }
}

static bool endpointIsHalted(uint8_t ep)
{
    switch (ep) {
    case EP_IN | EP1:
        return (USBFSD->UEP1_TX_CTRL & USBFS_UEP_T_RES_MASK) == USBFS_UEP_T_RES_STALL;
    case EP_OUT | EP2:
        return (USBFSD->UEP2_RX_CTRL & USBFS_UEP_R_RES_MASK) == USBFS_UEP_R_RES_STALL;
    case EP_IN | EP3:
        return (USBFSD->UEP3_TX_CTRL & USBFS_UEP_T_RES_MASK) == USBFS_UEP_T_RES_STALL;
    default:
        return false;
    }
}

static void handleGetDescriptor(uint16_t value, uint16_t requestLength)
{
    const uint8_t type = value >> 8;
    const uint8_t index = value & 0xff;
    const uint8_t *descriptor = NULL;
    uint16_t descriptorLength = 0;

    switch (type) {
    case USB_DESCR_TYP_DEVICE:
        descriptor = deviceDescriptor;
        descriptorLength = sizeof(deviceDescriptor);
        break;
    case USB_DESCR_TYP_CONFIG:
        descriptor = configDescriptor;
        descriptorLength = sizeof(configDescriptor);
        break;
    case USB_DESCR_TYP_STRING:
        switch (index) {
        case DEF_STRING_DESC_LANG:
            descriptor = langStringDescriptor;
            descriptorLength = sizeof(langStringDescriptor);
            break;
        case DEF_STRING_DESC_MANU:
            descriptor = manufacturerStringDescriptor;
            descriptorLength = sizeof(manufacturerStringDescriptor);
            break;
        case DEF_STRING_DESC_PROD:
            descriptor = productStringDescriptor;
            descriptorLength = sizeof(productStringDescriptor);
            break;
        case DEF_STRING_DESC_SERN:
            descriptor = serialStringDescriptor;
            descriptorLength = sizeof(serialStringDescriptor);
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }

    if (!descriptor) {
        ep0Stall();
        return;
    }

    ep0PrepareTx(descriptor, min16(descriptorLength, requestLength));
}

static void handleClassRequest(uint8_t requestType)
{
    switch (setupRequest) {
    case CDC_GET_LINE_CODING:
        if ((requestType & USB_REQ_TYP_IN) && setupLength != 0) {
            ep0PrepareTx((const uint8_t *)&lineCoding, min16(sizeof(lineCoding), setupLength));
        } else {
            ep0Stall();
        }
        break;

    case CDC_SET_LINE_CODING:
        if ((requestType & USB_REQ_TYP_IN) == 0 && setupLength == sizeof(lineCoding)) {
            USBFSD->UEP0_RX_CTRL = USBFS_UEP_R_TOG | USBFS_UEP_R_RES_ACK;
        } else {
            ep0Stall();
        }
        break;

    case CDC_SET_LINE_CTLSTE:
        controlLineState = setupValue;
        ep0StatusIn();
        break;

    case CDC_SEND_BREAK:
        ep0StatusIn();
        break;

    default:
        ep0Stall();
        break;
    }
}

static void handleStandardRequest(uint8_t requestType, uint16_t requestIndex)
{
    static uint8_t statusBuffer[2];

    switch (setupRequest) {
    case USB_GET_DESCRIPTOR:
        handleGetDescriptor(setupValue, setupLength);
        break;

    case USB_SET_ADDRESS:
        deviceAddress = setupValue & USBFS_USB_ADDR_MASK;
        setAddressPending = true;
        ep0StatusIn();
        break;

    case USB_GET_CONFIGURATION:
        statusBuffer[0] = deviceConfigured;
        ep0PrepareTx(statusBuffer, min16(1, setupLength));
        break;

    case USB_SET_CONFIGURATION:
        deviceConfigured = setupValue & 0xff;
        ep0StatusIn();
        break;

    case USB_GET_INTERFACE:
        statusBuffer[0] = 0;
        ep0PrepareTx(statusBuffer, min16(1, setupLength));
        break;

    case USB_SET_INTERFACE:
        ep0StatusIn();
        break;

    case USB_GET_STATUS:
        statusBuffer[0] = 0;
        statusBuffer[1] = 0;
        if ((requestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_ENDP) {
            statusBuffer[0] = endpointIsHalted(requestIndex & 0xff) ? 1 : 0;
        } else if ((requestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_DEVICE) {
            statusBuffer[0] = (deviceSleepStatus & 0x01) ? 0x02 : 0x00;
        }
        ep0PrepareTx(statusBuffer, min16(2, setupLength));
        break;

    case USB_CLEAR_FEATURE:
        if ((requestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_DEVICE &&
            (setupValue & 0xff) == USB_REQ_FEAT_REMOTE_WAKEUP) {
            deviceSleepStatus &= ~0x01;
            ep0StatusIn();
        } else if ((requestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_ENDP &&
                   (setupValue & 0xff) == USB_REQ_FEAT_ENDP_HALT &&
                   endpointHalt(requestIndex & 0xff, false)) {
            ep0StatusIn();
        } else {
            ep0Stall();
        }
        break;

    case USB_SET_FEATURE:
        if ((requestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_DEVICE &&
            (setupValue & 0xff) == USB_REQ_FEAT_REMOTE_WAKEUP) {
            deviceSleepStatus |= 0x01;
            ep0StatusIn();
        } else if ((requestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_ENDP &&
                   (setupValue & 0xff) == USB_REQ_FEAT_ENDP_HALT &&
                   endpointHalt(requestIndex & 0xff, true)) {
            ep0StatusIn();
        } else {
            ep0Stall();
        }
        break;

    default:
        ep0Stall();
        break;
    }
}

static void handleSetupToken(void)
{
    const PUSB_SETUP_REQ setup = (PUSB_SETUP_REQ)ep0Buffer;
    const uint8_t requestType = setup->bRequestType;
    const uint16_t requestIndex = setup->wIndex;

    USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_TOG | USBFS_UEP_T_RES_NAK;
    USBFSD->UEP0_RX_CTRL = USBFS_UEP_R_TOG | USBFS_UEP_R_RES_NAK;

    setupRequest = setup->bRequest;
    setupValue = setup->wValue;
    setupLength = setup->wLength;
    ep0DataPtr = NULL;
    ep0DataRemaining = 0;
    setAddressPending = false;

    if ((requestType & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
        handleStandardRequest(requestType, requestIndex);
    } else if ((requestType & USB_REQ_TYP_MASK) == USB_REQ_TYP_CLASS) {
        handleClassRequest(requestType);
    } else {
        ep0Stall();
    }
}

static void handleEp0In(void)
{
    if (ep0DataRemaining > 0) {
        const uint16_t txLen = min16(ep0DataRemaining, USB_EP0_SIZE);
        memcpy(ep0Buffer, ep0DataPtr, txLen);
        ep0DataPtr += txLen;
        ep0DataRemaining -= txLen;
        USBFSD->UEP0_TX_LEN = txLen;
        USBFSD->UEP0_TX_CTRL ^= USBFS_UEP_T_TOG;
        USBFSD->UEP0_TX_CTRL = (USBFSD->UEP0_TX_CTRL & ~USBFS_UEP_T_RES_MASK) | USBFS_UEP_T_RES_ACK;
        return;
    }

    if (setAddressPending) {
        USBFSD->DEV_ADDR = (USBFSD->DEV_ADDR & USBFS_UDA_GP_BIT) | deviceAddress;
        setAddressPending = false;
    }

    USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_RES_NAK;
    USBFSD->UEP0_RX_CTRL = USBFS_UEP_R_TOG | USBFS_UEP_R_RES_ACK;
}

static void handleEp0Out(uint8_t intst)
{
    if ((intst & USBFS_UIS_TOG_OK) && setupRequest == CDC_SET_LINE_CODING && USBFSD->RX_LEN >= sizeof(lineCoding)) {
        memcpy(&lineCoding, ep0Buffer, sizeof(lineCoding));
        ep0StatusIn();
    } else if ((intst & USBFS_UIS_TOG_OK) && USBFSD->RX_LEN == 0) {
        USBFSD->UEP0_RX_CTRL = USBFS_UEP_R_RES_ACK;
        USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_RES_NAK;
    } else {
        ep0Stall();
    }
}

static void handleDataOut(void)
{
    const uint16_t len = min16(USBFSD->RX_LEN, USB_FS_PACKET_SIZE);

    for (uint16_t i = 0; i < len; i++) {
        const uint16_t nextHead = (rxHead + 1) & USB_RX_BUFFER_MASK;
        if (nextHead == rxTail) {
            rxFlowStopped = true;
            break;
        }
        rxBuffer[rxHead] = ep2OutBuffer[i];
        rxHead = nextHead;
    }

    USBFSD->UEP2_RX_CTRL ^= USBFS_UEP_R_TOG;
    if (rxHasPacketRoom()) {
        USBFSD->UEP2_RX_CTRL = (USBFSD->UEP2_RX_CTRL & ~USBFS_UEP_R_RES_MASK) | USBFS_UEP_R_RES_ACK;
        rxFlowStopped = false;
    } else {
        USBFSD->UEP2_RX_CTRL = (USBFSD->UEP2_RX_CTRL & ~USBFS_UEP_R_RES_MASK) | USBFS_UEP_R_RES_NAK;
        rxFlowStopped = true;
    }
}

static void usbDeviceEndpointInit(void)
{
    USBFSD->UEP4_1_MOD = USBFS_UEP1_TX_EN;
    USBFSD->UEP2_3_MOD = USBFS_UEP2_RX_EN | USBFS_UEP3_TX_EN;
    USBFSD->UEP5_6_MOD = 0;
    USBFSD->UEP7_MOD = 0;

    USBFSD->UEP0_DMA = (uint32_t)ep0Buffer;
    USBFSD->UEP1_DMA = (uint32_t)ep1NotifyBuffer;
    USBFSD->UEP2_DMA = (uint32_t)ep2OutBuffer;
    USBFSD->UEP3_DMA = (uint32_t)ep3InBuffer;

    USBFSD->UEP0_TX_LEN = 0;
    USBFSD->UEP1_TX_LEN = 0;
    USBFSD->UEP2_TX_LEN = 0;
    USBFSD->UEP3_TX_LEN = 0;

    USBFSD->UEP0_RX_CTRL = USBFS_UEP_R_RES_ACK;
    USBFSD->UEP0_TX_CTRL = USBFS_UEP_T_RES_NAK;
    USBFSD->UEP1_TX_CTRL = USBFS_UEP_T_RES_NAK;
    USBFSD->UEP2_RX_CTRL = USBFS_UEP_R_RES_ACK;
    USBFSD->UEP3_TX_CTRL = USBFS_UEP_T_RES_NAK;

    txBusy = false;
    rxFlowStopped = false;
}

static void usbClockInit(void)
{
    if ((RCC->PLLCFGR & RCC_SYSPLL_SEL) != RCC_SYSPLL_USBHS) {
        RCC_USBHS_PLLCmd(DISABLE);
        RCC_USBHSPLLCLKConfig((RCC->CTLR & RCC_HSERDY) ? RCC_USBHSPLLSource_HSE : RCC_USBHSPLLSource_HSI);
        RCC_USBHSPLLReferConfig(RCC_USBHSPLLRefer_25M);
        RCC_USBHSPLLClockSourceDivConfig(RCC_USBHSPLL_IN_Div1);
        RCC_USBHS_PLLCmd(ENABLE);
        while (!(RCC->CTLR & RCC_USBHS_PLLRDY)) {
        }
    }

    RCC_USBFSCLKConfig(RCC_USBFSCLKSource_USBHSPLL);
    RCC_USBFS48ClockSourceDivConfig(RCC_USBFS_Div10);
    RCC_HBPeriphClockCmd(RCC_HBPeriph_OTG_FS, ENABLE);
    RCC_HB2PeriphClockCmd(RCC_HB2Periph_GPIOA, ENABLE);
}

static void usbDeviceInit(bool enable)
{
    if (enable) {
        USBFSH->BASE_CTRL = USBFS_UC_RESET_SIE | USBFS_UC_CLR_ALL;
        delayMicroseconds(10);
        USBFSH->BASE_CTRL = 0;

        USBFSD->DEV_ADDR = 0;
        deviceAddress = 0;
        deviceConfigured = 0;
        deviceSleepStatus = 0;
        rxHead = rxTail = 0;
        usbDeviceEndpointInit();

        USBFSD->INT_EN = USBFS_UIE_SUSPEND | USBFS_UIE_BUS_RST | USBFS_UIE_TRANSFER;
        USBFSD->BASE_CTRL = USBFS_UC_DEV_PU_EN | USBFS_UC_INT_BUSY | USBFS_UC_DMA_EN;
        USBFSD->UDEV_CTRL = USBFS_UD_PD_DIS | USBFS_UD_PORT_EN;

        NVIC_SetPriority(USBFS_IRQn, NVIC_PRIO_VCP);
        NVIC_EnableIRQ(USBFS_IRQn);
    } else {
        USBFSH->BASE_CTRL = USBFS_UC_RESET_SIE | USBFS_UC_CLR_ALL;
        delayMicroseconds(10);
        USBFSD->BASE_CTRL = 0;
        NVIC_DisableIRQ(USBFS_IRQn);
    }
}

static uint32_t usbCdcSendPacket(const uint8_t *data, uint32_t len)
{
    const uint32_t start = millis();

    while (txBusy) {
        if (millis() - start > USB_TIMEOUT_MS) {
            return 0;
        }
    }

    if (len > USB_FS_PACKET_SIZE) {
        len = USB_FS_PACKET_SIZE;
    }

    if (len > 0) {
        memcpy(ep3InBuffer, data, len);
    }

    txBusy = true;
    USBFSD->UEP3_TX_LEN = len;
    USBFSD->UEP3_TX_CTRL = (USBFSD->UEP3_TX_CTRL & ~USBFS_UEP_T_RES_MASK) | USBFS_UEP_T_RES_ACK;

    return len;
}

static uint32_t usbCdcSendData(const uint8_t *data, uint32_t len)
{
    if (!usbIsConfigured()) {
        return 0;
    }

    uint32_t sent = 0;
    while (sent < len) {
        const uint32_t chunk = usbCdcSendPacket(data + sent, len - sent);
        if (chunk == 0) {
            break;
        }
        sent += chunk;
    }

    if (sent == len && len != 0 && (len % USB_FS_PACKET_SIZE) == 0) {
        usbCdcSendPacket(data + sent, 0);
    }

    return sent;
}

void USBFS_IRQHandler(void) CH32_IRQ_HANDLER_ATTR;
void USBFS_IRQHandler(void)
{
    const uint8_t intflag = USBFSD->INT_FG;
    const uint8_t intst = USBFSD->INT_ST;

    if (intflag & USBFS_UIF_TRANSFER) {
        switch (intst & USBFS_UIS_TOKEN_MASK) {
        case USBFS_UIS_TOKEN_IN:
            switch (intst & (USBFS_UIS_TOKEN_MASK | USBFS_UIS_ENDP_MASK)) {
            case USBFS_UIS_TOKEN_IN | EP0:
                handleEp0In();
                break;
            case USBFS_UIS_TOKEN_IN | EP1:
                USBFSD->UEP1_TX_CTRL ^= USBFS_UEP_T_TOG;
                USBFSD->UEP1_TX_CTRL = (USBFSD->UEP1_TX_CTRL & ~USBFS_UEP_T_RES_MASK) | USBFS_UEP_T_RES_NAK;
                break;
            case USBFS_UIS_TOKEN_IN | EP3:
                USBFSD->UEP3_TX_CTRL ^= USBFS_UEP_T_TOG;
                USBFSD->UEP3_TX_CTRL = (USBFSD->UEP3_TX_CTRL & ~USBFS_UEP_T_RES_MASK) | USBFS_UEP_T_RES_NAK;
                txBusy = false;
                break;
            default:
                break;
            }
            break;

        case USBFS_UIS_TOKEN_OUT:
            switch (intst & (USBFS_UIS_TOKEN_MASK | USBFS_UIS_ENDP_MASK)) {
            case USBFS_UIS_TOKEN_OUT | EP0:
                handleEp0Out(intst);
                break;
            case USBFS_UIS_TOKEN_OUT | EP2:
                if (intst & USBFS_UIS_TOG_OK) {
                    handleDataOut();
                }
                break;
            default:
                break;
            }
            break;

        case USBFS_UIS_TOKEN_SETUP:
            handleSetupToken();
            break;

        default:
            break;
        }

        USBFSD->INT_FG = USBFS_UIF_TRANSFER;
    } else if (intflag & USBFS_UIF_BUS_RST) {
        USBFSD->DEV_ADDR = 0;
        deviceAddress = 0;
        deviceConfigured = 0;
        deviceSleepStatus = 0;
        setAddressPending = false;
        rxHead = rxTail = 0;
        usbDeviceEndpointInit();
        USBFSD->INT_FG = USBFS_UIF_BUS_RST;
    } else if (intflag & USBFS_UIF_SUSPEND) {
        if (USBFSD->MIS_ST & USBFS_UMS_SUSPEND) {
            deviceSleepStatus |= 0x02;
        } else {
            deviceSleepStatus &= ~0x02;
        }
        USBFSD->INT_FG = USBFS_UIF_SUSPEND;
    } else {
        USBFSD->INT_FG = intflag;
    }
}

static void usbVcpSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    UNUSED(instance);
    lineCoding.bitrate = baudRate;
}

static void usbVcpSetMode(serialPort_t *instance, portMode_t mode)
{
    UNUSED(instance);
    UNUSED(mode);
}

static void usbVcpSetOptions(serialPort_t *instance, portOptions_t options)
{
    UNUSED(instance);
    UNUSED(options);
}

static bool isUsbVcpTransmitBufferEmpty(const serialPort_t *instance)
{
    UNUSED(instance);
    return !txBusy;
}

static uint32_t usbVcpAvailable(const serialPort_t *instance)
{
    UNUSED(instance);
    return rxBytesAvailable();
}

static uint8_t usbVcpRead(serialPort_t *instance)
{
    UNUSED(instance);

    if (rxHead == rxTail) {
        return 0;
    }

    const uint8_t c = rxBuffer[rxTail];
    rxTail = (rxTail + 1) & USB_RX_BUFFER_MASK;
    usbRxEndpointMaybeResume();
    return c;
}

static bool usbVcpIsConnected(const serialPort_t *instance)
{
    UNUSED(instance);
    return usbIsConfigured();
}

static void usbVcpWriteBuf(serialPort_t *instance, const void *data, int count)
{
    UNUSED(instance);

    const uint32_t start = millis();
    const uint8_t *p = data;
    while (count > 0) {
        const uint32_t sent = usbCdcSendData(p, count);
        if (sent == 0) {
            break;
        }
        count -= sent;
        p += sent;

        if (millis() - start > USB_TIMEOUT_MS) {
            break;
        }
    }
}

static bool usbVcpFlush(vcpPort_t *port)
{
    uint32_t count = port->txAt;
    port->txAt = 0;

    if (count == 0) {
        return true;
    }

    if (!usbIsConfigured()) {
        return false;
    }

    const uint32_t sent = usbCdcSendData(port->txBuf, count);
    return sent == count;
}

static void usbVcpWrite(serialPort_t *instance, uint8_t c)
{
    vcpPort_t *port = container_of(instance, vcpPort_t, port);

    port->txBuf[port->txAt++] = c;
    if (!port->buffering || port->txAt >= ARRAYLEN(port->txBuf)) {
        usbVcpFlush(port);
    }
}

static void usbVcpBeginWrite(serialPort_t *instance)
{
    vcpPort_t *port = container_of(instance, vcpPort_t, port);
    port->buffering = true;
}

static uint32_t usbTxBytesFree(const serialPort_t *instance)
{
    UNUSED(instance);
    return txBusy ? 0 : USB_FS_PACKET_SIZE;
}

static void usbVcpEndWrite(serialPort_t *instance)
{
    vcpPort_t *port = container_of(instance, vcpPort_t, port);
    port->buffering = false;
    usbVcpFlush(port);
}

static const struct serialPortVTable usbVTable[] = {
    {
        .serialWrite = usbVcpWrite,
        .serialTotalRxWaiting = usbVcpAvailable,
        .serialTotalTxFree = usbTxBytesFree,
        .serialRead = usbVcpRead,
        .serialSetBaudRate = usbVcpSetBaudRate,
        .isSerialTransmitBufferEmpty = isUsbVcpTransmitBufferEmpty,
        .setMode = usbVcpSetMode,
        .setOptions = usbVcpSetOptions,
        .isConnected = usbVcpIsConnected,
        .writeBuf = usbVcpWriteBuf,
        .beginWrite = usbVcpBeginWrite,
        .endWrite = usbVcpEndWrite,
        .isIdle = NULL,
    }
};

void usbVcpInitHardware(void)
{
    IOInit(IOGetByTag(IO_TAG(PA11)), OWNER_USB, RESOURCE_INPUT, 0);
    IOInit(IOGetByTag(IO_TAG(PA12)), OWNER_USB, RESOURCE_OUTPUT, 0);

    usbGenerateDisconnectPulse();

    usbClockInit();
    usbDeviceInit(true);
}

serialPort_t *usbVcpOpen(void)
{
    vcpPort_t *s = &vcpPort;

    s->port.vTable = usbVTable;
    s->txAt = 0;
    s->buffering = false;

    return (serialPort_t *)s;
}

uint32_t usbVcpGetBaudRate(serialPort_t *instance)
{
    UNUSED(instance);
    return lineCoding.bitrate;
}

#endif
