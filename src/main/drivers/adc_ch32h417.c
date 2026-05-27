/*
 * CH32H417/H415 ADC1 support.
 *
 * Uses WCH StdPeriph ADC1 + DMA1 channel 1. The board currently only needs
 * low-rate battery/current monitoring, so ADC2 and injected conversions are
 * deliberately left out.
 */

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "platform.h"

#include "common/utils.h"

#include "drivers/io.h"
#include "io_impl.h"
#include "rcc.h"

#include "adc.h"
#include "adc_impl.h"

#define CH32_DMA_REQUEST_ADC1 0x78U

static adcDevice_t adcHardware[ADCDEV_COUNT] = {
    { .ADCx = ADC1, .rccADC = RCC_AHB2(ADC1), .rccDMA = RCC_AHB(DMA1), .DMAy_Channelx = DMA1_Channel1, .enabled = false, .usedChannelCount = 0 },
};

const adcTagMap_t adcTagMap[] = {
    { DEFIO_TAG_E__PC0, ADC_Channel_10 },
    { DEFIO_TAG_E__PC1, ADC_Channel_11 },
    { DEFIO_TAG_E__PC2, ADC_Channel_12 },
    { DEFIO_TAG_E__PC3, ADC_Channel_13 },
    { DEFIO_TAG_E__PC4, ADC_Channel_14 },
    { DEFIO_TAG_E__PC5, ADC_Channel_15 },
    { DEFIO_TAG_E__PB0, ADC_Channel_8  },
    { DEFIO_TAG_E__PB1, ADC_Channel_9  },
    { DEFIO_TAG_E__PA0, ADC_Channel_0  },
    { DEFIO_TAG_E__PA1, ADC_Channel_1  },
    { DEFIO_TAG_E__PA2, ADC_Channel_2  },
    { DEFIO_TAG_E__PA3, ADC_Channel_3  },
    { DEFIO_TAG_E__PA4, ADC_Channel_4  },
    { DEFIO_TAG_E__PA5, ADC_Channel_5  },
    { DEFIO_TAG_E__PA6, ADC_Channel_6  },
    { DEFIO_TAG_E__PA7, ADC_Channel_7  },
};

ADCDevice adcDeviceByInstance(ADC_TypeDef *instance)
{
    if (instance == ADC1) {
        return ADCDEV_1;
    }

    return ADCINVALID;
}

static void adcDmaInit(adcDevice_t *adc, ADCDevice adcDevice)
{
    DMA_InitTypeDef dmaInit;

    RCC_ClockCmd(adc->rccDMA, ENABLE);
    DMA_DeInit(adc->DMAy_Channelx);
    DMA_StructInit(&dmaInit);

    dmaInit.DMA_PeripheralBaseAddr = (uint32_t)&adc->ADCx->RDATAR;
    dmaInit.DMA_Memory0BaseAddr = (uint32_t)adcValues[adcDevice];
    dmaInit.DMA_DIR = DMA_DIR_PeripheralSRC;
    dmaInit.DMA_BufferSize = adc->usedChannelCount * ADC_AVERAGE_N_SAMPLES;
    dmaInit.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    dmaInit.DMA_MemoryInc = ((adc->usedChannelCount > 1) || (ADC_AVERAGE_N_SAMPLES > 1)) ? DMA_MemoryInc_Enable : DMA_MemoryInc_Disable;
    dmaInit.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    dmaInit.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    dmaInit.DMA_Mode = DMA_Mode_Circular;
    dmaInit.DMA_Priority = DMA_Priority_High;
    dmaInit.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(adc->DMAy_Channelx, &dmaInit);

    DMA_MuxChannelConfig(DMA_MuxChannel1, CH32_DMA_REQUEST_ADC1);
    DMA_Cmd(adc->DMAy_Channelx, ENABLE);
}

static void adcInstanceInit(ADCDevice adcDevice)
{
    ADC_InitTypeDef adcInit = { 0 };
    adcDevice_t *adc = &adcHardware[adcDevice];

    RCC_ClockCmd(adc->rccADC, ENABLE);
    RCC_ADCCLKConfig(RCC_ADCCLKSource_HCLK);

    ADC_DeInit(adc->ADCx);

    adcInit.ADC_Mode = ADC_Mode_Independent;
    adcInit.ADC_ScanConvMode = adc->usedChannelCount > 1 ? ENABLE : DISABLE;
    adcInit.ADC_ContinuousConvMode = ENABLE;
    adcInit.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    adcInit.ADC_DataAlign = ADC_DataAlign_Right;
    adcInit.ADC_NbrOfChannel = adc->usedChannelCount;
    adcInit.ADC_OutputBuffer = ADC_OutputBuffer_Disable;
    adcInit.ADC_Pga = ADC_Pga_1;
    ADC_Init(adc->ADCx, &adcInit);

    uint8_t rank = 1;
    for (int i = ADC_CHN_1; i < ADC_CHN_COUNT; i++) {
        if (!adcConfig[i].enabled || adcConfig[i].adcDevice != adcDevice) {
            continue;
        }

        ADC_SMP_ModeConfig(adc->ADCx, adcConfig[i].adcChannel, ADC_SMP_CFG_MODE1);
        ADC_RegularChannelConfig(adc->ADCx, adcConfig[i].adcChannel, rank++, adcConfig[i].sampleTime);
    }

    adcDmaInit(adc, adcDevice);

    ADC_LowPowerModeCmd(adc->ADCx, ENABLE);
    ADC_Cmd(adc->ADCx, ENABLE);
    ADC_DMACmd(adc->ADCx, ENABLE);
    ADC_BufferCmd(adc->ADCx, DISABLE);

    ADC_ResetCalibration(adc->ADCx);
    while (ADC_GetResetCalibrationStatus(adc->ADCx)) {
        ;
    }

    ADC_StartCalibration(adc->ADCx);
    while (ADC_GetCalibrationStatus(adc->ADCx)) {
        ;
    }

    ADC_SoftwareStartConvCmd(adc->ADCx, ENABLE);
}

void adcHardwareInit(drv_adc_config_t *init)
{
    UNUSED(init);
    int configuredAdcChannels = 0;

    for (int i = ADC_CHN_1; i < ADC_CHN_COUNT; i++) {
        if (!adcConfig[i].tag) {
            continue;
        }

        adcDevice_t *adc = &adcHardware[adcConfig[i].adcDevice];
        IO_t io = IOGetByTag(adcConfig[i].tag);

        IOInit(io, OWNER_ADC, RESOURCE_ADC_CH1 + (i - ADC_CHN_1), 0);
        IOConfigGPIO(io, GPIO_Mode_AIN);

        adcConfig[i].adcChannel = adcChannelByTag(adcConfig[i].tag);
        adcConfig[i].dmaIndex = adc->usedChannelCount++;
        adcConfig[i].sampleTime = ADC_SampleTime_CyclesMode5;
        adcConfig[i].enabled = true;

        adc->enabled = true;
        configuredAdcChannels++;
    }

    if (configuredAdcChannels == 0) {
        return;
    }

    for (int i = 0; i < ADCDEV_COUNT; i++) {
        if (adcHardware[i].enabled) {
            adcInstanceInit(i);
        }
    }
}
