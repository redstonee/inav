/*
 * CH32H417/H415 standard-peripheral timer implementation.
 *
 * This supports normal PWM outputs and input capture callbacks. DMA-backed
 * PWM/DShot is intentionally left disabled until CH32 DMA descriptors are
 * wired into INAV.
 */

#include <stdbool.h>
#include <stdint.h>
#include <math.h>

#include "platform.h"

#include "common/utils.h"

#include "drivers/nvic.h"
#include "drivers/timer.h"
#include "drivers/timer_impl.h"

const uint16_t lookupDMASourceTable[4] = { TIM_DMA_CC1, TIM_DMA_CC2, TIM_DMA_CC3, TIM_DMA_CC4 };
const uint8_t lookupTIMChannelTable[4] = { TIM_Channel_1, TIM_Channel_2, TIM_Channel_3, TIM_Channel_4 };

void impl_timerInitContext(timHardwareContext_t *timCtx)
{
    (void)timCtx;
}

void impl_timerNVICConfigure(TCH_t *tch, int irqPriority)
{
    if (tch->timCtx->timDef->irq) {
        NVIC_SetPriority(tch->timCtx->timDef->irq, irqPriority);
        NVIC_EnableIRQ(tch->timCtx->timDef->irq);
    }

    if (tch->timCtx->timDef->secondIrq) {
        NVIC_SetPriority(tch->timCtx->timDef->secondIrq, irqPriority);
        NVIC_EnableIRQ(tch->timCtx->timDef->secondIrq);
    }
}

void impl_timerConfigBase(TCH_t *tch, uint16_t period, uint32_t hz)
{
    TIM_TypeDef *tim = tch->timCtx->timDef->tim;
    TIM_TimeBaseInitTypeDef timeBase;

    TIM_TimeBaseStructInit(&timeBase);
    timeBase.TIM_Period = (period - 1) & 0xffff;
    timeBase.TIM_Prescaler = lrintf((float)timerGetBaseClock(tch) / hz + 0.01f) - 1;
    timeBase.TIM_ClockDivision = TIM_CKD_DIV1;
    timeBase.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInit(tim, &timeBase);
}

void impl_enableTimer(TCH_t *tch)
{
    TIM_Cmd(tch->timHw->tim, ENABLE);
}

void impl_timerPWMStart(TCH_t *tch)
{
    TIM_CtrlPWMOutputs(tch->timHw->tim, ENABLE);
}

void impl_timerEnableIT(TCH_t *tch, uint32_t interrupt)
{
    TIM_ITConfig(tch->timHw->tim, interrupt, ENABLE);
}

void impl_timerDisableIT(TCH_t *tch, uint32_t interrupt)
{
    TIM_ITConfig(tch->timHw->tim, interrupt, DISABLE);
}

void impl_timerClearFlag(TCH_t *tch, uint32_t flag)
{
    TIM_ClearFlag(tch->timHw->tim, flag);
}

static unsigned getFilter(unsigned ticks)
{
    static const unsigned filterTable[16] = {
        1 * 1,
        1 * 2, 1 * 4, 1 * 8,
        2 * 6, 2 * 8,
        4 * 6, 4 * 8,
        8 * 6, 8 * 8,
        16 * 5, 16 * 6, 16 * 8,
        32 * 5, 32 * 6, 32 * 8
    };

    for (unsigned i = 1; i < ARRAYLEN(filterTable); i++) {
        if (filterTable[i] > ticks) {
            return i - 1;
        }
    }

    return 0x0f;
}

void impl_timerChConfigIC(TCH_t *tch, bool polarityRising, unsigned inputFilterTicks)
{
    TIM_ICInitTypeDef icInit;

    TIM_ICStructInit(&icInit);
    icInit.TIM_Channel = lookupTIMChannelTable[tch->timHw->channelIndex];
    icInit.TIM_ICPolarity = polarityRising ? TIM_ICPolarity_Rising : TIM_ICPolarity_Falling;
    icInit.TIM_ICSelection = TIM_ICSelection_DirectTI;
    icInit.TIM_ICPrescaler = TIM_ICPSC_DIV1;
    icInit.TIM_ICFilter = getFilter(inputFilterTicks);

    TIM_ICInit(tch->timHw->tim, &icInit);
}

static uint32_t timerCaptureValue(TIM_TypeDef *tim, unsigned channelIndex)
{
    switch (channelIndex) {
        case 0:
            return tim->CH1CVR;
        case 1:
            return tim->CH2CVR;
        case 2:
            return tim->CH3CVR;
        case 3:
            return tim->CH4CVR;
    }

    return 0;
}

static void timerHandleOverflow(timHardwareContext_t *timerCtx, uint32_t capture)
{
    for (unsigned i = 0; i < CC_CHANNELS_PER_TIMER; i++) {
        if (timerCtx->ch[i].cb && timerCtx->ch[i].cb->callbackOvr) {
            timerCtx->ch[i].cb->callbackOvr(&timerCtx->ch[i], capture);
        }
    }
}

void impl_timerCaptureCompareHandler(TIM_TypeDef *tim, timHardwareContext_t *timerCtx)
{
    uint32_t status = tim->INTFR & tim->DMAINTENR;

    if (status & TIM_IT_Update) {
        TIM_ClearITPendingBit(tim, TIM_IT_Update);

        if (timerCtx) {
            timerHandleOverflow(timerCtx, tim->ATRLR);
        }
    }

    for (unsigned i = 0; i < CC_CHANNELS_PER_TIMER; i++) {
        const uint32_t it = TIM_IT_CCx(i);

        if (!(status & it)) {
            continue;
        }

        const uint32_t capture = timerCaptureValue(tim, i);
        TIM_ClearITPendingBit(tim, it);

        if (timerCtx && timerCtx->ch[i].cb && timerCtx->ch[i].cb->callbackEdge) {
            timerCtx->ch[i].cb->callbackEdge(&timerCtx->ch[i], capture);
        }
    }
}

void impl_timerPWMConfigChannel(TCH_t *tch, uint16_t value)
{
    const bool inverted = tch->timHw->output & TIMER_OUTPUT_INVERTED;

    TIM_OCInitTypeDef ocInit;

    TIM_OCStructInit(&ocInit);
    ocInit.TIM_OCMode = TIM_OCMode_PWM1;
    ocInit.TIM_Pulse = value;

    if (tch->timHw->output & TIMER_OUTPUT_N_CHANNEL) {
        ocInit.TIM_OutputState = TIM_OutputState_Disable;
        ocInit.TIM_OutputNState = TIM_OutputNState_Enable;
        ocInit.TIM_OCNPolarity = inverted ? TIM_OCPolarity_Low : TIM_OCPolarity_High;
        ocInit.TIM_OCNIdleState = TIM_OCIdleState_Reset;
    } else {
        ocInit.TIM_OutputState = TIM_OutputState_Enable;
        ocInit.TIM_OutputNState = TIM_OutputNState_Disable;
        ocInit.TIM_OCPolarity = inverted ? TIM_OCPolarity_Low : TIM_OCPolarity_High;
        ocInit.TIM_OCIdleState = TIM_OCIdleState_Set;
    }

    switch (tch->timHw->channelIndex) {
        case 0:
            TIM_OC1Init(tch->timHw->tim, &ocInit);
            TIM_OC1PreloadConfig(tch->timHw->tim, TIM_OCPreload_Enable);
            break;
        case 1:
            TIM_OC2Init(tch->timHw->tim, &ocInit);
            TIM_OC2PreloadConfig(tch->timHw->tim, TIM_OCPreload_Enable);
            break;
        case 2:
            TIM_OC3Init(tch->timHw->tim, &ocInit);
            TIM_OC3PreloadConfig(tch->timHw->tim, TIM_OCPreload_Enable);
            break;
        case 3:
            TIM_OC4Init(tch->timHw->tim, &ocInit);
            TIM_OC4PreloadConfig(tch->timHw->tim, TIM_OCPreload_Enable);
            break;
    }
}

volatile timCCR_t *impl_timerCCR(TCH_t *tch)
{
    switch (tch->timHw->channelIndex) {
        case 0:
            return &tch->timHw->tim->CH1CVR_32;
        case 1:
            return &tch->timHw->tim->CH2CVR_32;
        case 2:
            return &tch->timHw->tim->CH3CVR_32;
        case 3:
            return &tch->timHw->tim->CH4CVR_32;
    }

    return NULL;
}

void impl_timerChCaptureCompareEnable(TCH_t *tch, bool enable)
{
    TIM_CCxCmd(tch->timHw->tim, lookupTIMChannelTable[tch->timHw->channelIndex], enable ? TIM_CCx_Enable : TIM_CCx_Disable);
}

bool impl_timerPWMConfigChannelDMA(TCH_t *tch, void *dmaBuffer, uint8_t dmaBufferElementSize, uint32_t dmaBufferElementCount)
{
    (void)tch;
    (void)dmaBuffer;
    (void)dmaBufferElementSize;
    (void)dmaBufferElementCount;
    return false;
}

void impl_timerPWMPrepareDMA(TCH_t *tch, uint32_t dmaBufferElementCount)
{
    (void)tch;
    (void)dmaBufferElementCount;
}

void impl_timerPWMStartDMA(TCH_t *tch)
{
    (void)tch;
}

void impl_timerPWMStopDMA(TCH_t *tch)
{
    if (tch) {
        tch->dmaState = TCH_DMA_IDLE;
    }
}
