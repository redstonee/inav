/*
 * CH32H417/H415 SPI bus support using the WCH standard peripheral library.
 */

#include <stdbool.h>
#include <stdint.h>

#include "platform.h"

#ifdef USE_SPI

#include "drivers/bus_spi.h"
#include "drivers/io.h"
#include "drivers/io_impl.h"
#include "drivers/rcc.h"

#ifndef SPI1_SCK_PIN
#define SPI1_NSS_PIN            PA4
#define SPI1_SCK_PIN            PA5
#define SPI1_MISO_PIN           PA6
#define SPI1_MOSI_PIN           PA7
#endif

#ifndef SPI2_SCK_PIN
#define SPI2_NSS_PIN            PB12
#define SPI2_SCK_PIN            PB13
#define SPI2_MISO_PIN           PC2
#define SPI2_MOSI_PIN           PC1
#endif

#ifndef SPI3_SCK_PIN
#define SPI3_NSS_PIN            PA15
#define SPI3_SCK_PIN            PC10
#define SPI3_MISO_PIN           PC11
#define SPI3_MOSI_PIN           PC12
#endif

#ifndef SPI4_SCK_PIN
#define SPI4_NSS_PIN            NONE
#define SPI4_SCK_PIN            PE12
#define SPI4_MISO_PIN           PE13
#define SPI4_MOSI_PIN           PE14
#endif

#ifndef SPI1_NSS_PIN
#define SPI1_NSS_PIN            NONE
#endif
#ifndef SPI2_NSS_PIN
#define SPI2_NSS_PIN            NONE
#endif
#ifndef SPI3_NSS_PIN
#define SPI3_NSS_PIN            NONE
#endif
#ifndef SPI4_NSS_PIN
#define SPI4_NSS_PIN            NONE
#endif

static const uint32_t spiDivisorMapFast[] = {
    SPI_BaudRatePrescaler_Mode7,    // initialization
    SPI_BaudRatePrescaler_Mode6,    // slow
    SPI_BaudRatePrescaler_Mode4,    // standard
    SPI_BaudRatePrescaler_Mode3,    // fast
    SPI_BaudRatePrescaler_Mode3,    // ultrafast, capped for BMI088 margin
};

static const uint32_t spiDivisorMapSlow[] = {
    SPI_BaudRatePrescaler_Mode7,
    SPI_BaudRatePrescaler_Mode6,
    SPI_BaudRatePrescaler_Mode4,
    SPI_BaudRatePrescaler_Mode3,
    SPI_BaudRatePrescaler_Mode3,
};

static spiDevice_t spiHardwareMap[] = {
#ifdef USE_SPI_DEVICE_1
    { .dev = SPI1, .nss = IO_TAG(SPI1_NSS_PIN), .sck = IO_TAG(SPI1_SCK_PIN), .miso = IO_TAG(SPI1_MISO_PIN), .mosi = IO_TAG(SPI1_MOSI_PIN), .rcc = RCC_AHB2(SPI1), .sckAF = GPIO_AF5, .misoAF = GPIO_AF5, .mosiAF = GPIO_AF5, .divisorMap = spiDivisorMapFast },
#else
    { .dev = NULL },
#endif
#ifdef USE_SPI_DEVICE_2
    { .dev = SPI2, .nss = IO_TAG(SPI2_NSS_PIN), .sck = IO_TAG(SPI2_SCK_PIN), .miso = IO_TAG(SPI2_MISO_PIN), .mosi = IO_TAG(SPI2_MOSI_PIN), .rcc = RCC_AHB1(SPI2), .sckAF = GPIO_AF5, .misoAF = GPIO_AF5, .mosiAF = GPIO_AF5, .divisorMap = spiDivisorMapSlow },
#else
    { .dev = NULL },
#endif
#ifdef USE_SPI_DEVICE_3
    { .dev = SPI3, .nss = IO_TAG(SPI3_NSS_PIN), .sck = IO_TAG(SPI3_SCK_PIN), .miso = IO_TAG(SPI3_MISO_PIN), .mosi = IO_TAG(SPI3_MOSI_PIN), .rcc = RCC_AHB1(SPI3), .sckAF = GPIO_AF6, .misoAF = GPIO_AF6, .mosiAF = GPIO_AF6, .divisorMap = spiDivisorMapSlow },
#else
    { .dev = NULL },
#endif
#ifdef USE_SPI_DEVICE_4
    { .dev = SPI4, .nss = IO_TAG(SPI4_NSS_PIN), .sck = IO_TAG(SPI4_SCK_PIN), .miso = IO_TAG(SPI4_MISO_PIN), .mosi = IO_TAG(SPI4_MOSI_PIN), .rcc = RCC_AHB1(SPI4), .sckAF = GPIO_AF6, .misoAF = GPIO_AF6, .mosiAF = GPIO_AF6, .divisorMap = spiDivisorMapSlow },
#else
    { .dev = NULL },
#endif
};

SPIDevice spiDeviceByInstance(SPI_TypeDef *instance)
{
    if (instance == SPI1) {
        return SPIDEV_1;
    }

    if (instance == SPI2) {
        return SPIDEV_2;
    }

    if (instance == SPI3) {
        return SPIDEV_3;
    }

    if (instance == SPI4) {
        return SPIDEV_4;
    }

    return SPIINVALID;
}

bool spiInitDevice(SPIDevice device, bool leadingEdge)
{
    spiDevice_t *spi = &spiHardwareMap[device];

    if (!spi->dev) {
        return false;
    }

    if (spi->initDone) {
        return true;
    }

    RCC_ClockCmd(spi->rcc, ENABLE);
    RCC_ResetCmd(spi->rcc, ENABLE);
    RCC_ResetCmd(spi->rcc, DISABLE);

    IOInit(IOGetByTag(spi->sck), OWNER_SPI, RESOURCE_SPI_SCK, device + 1);
    IOInit(IOGetByTag(spi->miso), OWNER_SPI, RESOURCE_SPI_MISO, device + 1);
    IOInit(IOGetByTag(spi->mosi), OWNER_SPI, RESOURCE_SPI_MOSI, device + 1);

    IOConfigGPIOAF(IOGetByTag(spi->sck), SPI_IO_AF_SCK_CFG, spi->sckAF);
    IOConfigGPIOAF(IOGetByTag(spi->miso), SPI_IO_AF_MISO_CFG, spi->misoAF);
    IOConfigGPIOAF(IOGetByTag(spi->mosi), SPI_IO_AF_CFG, spi->mosiAF);

    if (spi->nss) {
        IOInit(IOGetByTag(spi->nss), OWNER_SPI, RESOURCE_SPI_CS, device + 1);
        IOConfigGPIO(IOGetByTag(spi->nss), SPI_IO_CS_CFG);
        IOHi(IOGetByTag(spi->nss));
    }

    SPI_I2S_DeInit(spi->dev);

    SPI_InitTypeDef spiInit;
    SPI_StructInit(&spiInit);
    spiInit.SPI_Mode = SPI_Mode_Master;
    spiInit.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
    spiInit.SPI_DataSize = SPI_DataSize_8b;
    spiInit.SPI_NSS = SPI_NSS_Soft;
    spiInit.SPI_FirstBit = SPI_FirstBit_MSB;
    spiInit.SPI_CRCPolynomial = 7;
    spiInit.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_Mode4;

    if (leadingEdge) {
        spiInit.SPI_CPOL = SPI_CPOL_Low;
        spiInit.SPI_CPHA = SPI_CPHA_1Edge;
    } else {
        spiInit.SPI_CPOL = SPI_CPOL_High;
        spiInit.SPI_CPHA = SPI_CPHA_2Edge;
    }

    SPI_Init(spi->dev, &spiInit);
    SPI_Cmd(spi->dev, ENABLE);

    spi->initDone = true;
    return true;
}

uint32_t spiTimeoutUserCallback(SPI_TypeDef *instance)
{
    const SPIDevice device = spiDeviceByInstance(instance);

    if (device == SPIINVALID) {
        return (uint32_t)-1;
    }

    spiHardwareMap[device].errorCount++;
    return spiHardwareMap[device].errorCount;
}

uint8_t spiTransferByte(SPI_TypeDef *instance, uint8_t data)
{
    uint16_t spiTimeout = 1000;

    while (SPI_I2S_GetFlagStatus(instance, SPI_I2S_FLAG_TXE) == RESET) {
        if ((spiTimeout--) == 0) {
            return spiTimeoutUserCallback(instance);
        }
    }

    SPI_I2S_SendData(instance, data);

    spiTimeout = 1000;
    while (SPI_I2S_GetFlagStatus(instance, SPI_I2S_FLAG_RXNE) == RESET) {
        if ((spiTimeout--) == 0) {
            return spiTimeoutUserCallback(instance);
        }
    }

    return (uint8_t)SPI_I2S_ReceiveData(instance);
}

bool spiIsBusBusy(SPI_TypeDef *instance)
{
    return SPI_I2S_GetFlagStatus(instance, SPI_I2S_FLAG_TXE) == RESET ||
           SPI_I2S_GetFlagStatus(instance, SPI_I2S_FLAG_BSY) == SET;
}

bool spiTransfer(SPI_TypeDef *instance, uint8_t *out, const uint8_t *in, int len)
{
    uint16_t spiTimeout = 1000;

    (void)instance->DATAR;

    while (len--) {
        uint8_t b = in ? *(in++) : 0xff;

        while (SPI_I2S_GetFlagStatus(instance, SPI_I2S_FLAG_TXE) == RESET) {
            if ((spiTimeout--) == 0) {
                return false;
            }
        }

        SPI_I2S_SendData(instance, b);

        spiTimeout = 1000;
        while (SPI_I2S_GetFlagStatus(instance, SPI_I2S_FLAG_RXNE) == RESET) {
            if ((spiTimeout--) == 0) {
                return false;
            }
        }

        b = SPI_I2S_ReceiveData(instance);

        if (out) {
            *(out++) = b;
        }
    }

    return true;
}

void spiSetSpeed(SPI_TypeDef *instance, SPIClockSpeed_e speed)
{
    const SPIDevice device = spiDeviceByInstance(instance);

    if (device == SPIINVALID) {
        return;
    }

    SPI_Cmd(instance, DISABLE);

    uint16_t ctrl1 = instance->CTLR1;
    ctrl1 &= (uint16_t)~SPI_CTLR1_BR;
    ctrl1 |= spiHardwareMap[device].divisorMap[speed];
    instance->CTLR1 = ctrl1;

    SPI_Cmd(instance, ENABLE);
}

uint16_t spiGetErrorCounter(SPI_TypeDef *instance)
{
    const SPIDevice device = spiDeviceByInstance(instance);

    if (device == SPIINVALID) {
        return 0;
    }

    return spiHardwareMap[device].errorCount;
}

void spiResetErrorCounter(SPI_TypeDef *instance)
{
    const SPIDevice device = spiDeviceByInstance(instance);

    if (device != SPIINVALID) {
        spiHardwareMap[device].errorCount = 0;
    }
}

SPI_TypeDef *spiInstanceByDevice(SPIDevice device)
{
    return spiHardwareMap[device].dev;
}

#endif
