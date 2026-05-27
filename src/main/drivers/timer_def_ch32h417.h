/*
 * Timer pin/AF definitions for the WCH CH32H417/H416/H415 family.
 */

#pragma once

#define timerDMASafeType_t  uint32_t

#define DEF_TIM_DMAMAP__D(dma, stream, channel)         DMA_TAG(dma, stream, channel)
#define DEF_TIM_DMAMAP__NONE                            DMA_NONE

#define DEF_TIM(tim, ch, pin, usage, flags, dmavar) \
    { tim, IO_TAG(pin), DEF_TIM_CHNL_ ## ch, DEF_TIM_OUTPUT(ch) | flags, IOCFG_AF_PP, DEF_TIM_AF(TCH_ ## tim ## _ ## ch, pin), usage, DEF_TIM_DMAMAP(dmavar, tim ## _ ## ch) }

#define DEF_TIM_AF(timch, pin)        CONCAT(DEF_TIM_AF__, DEF_TIM_AF__ ## pin ## __ ## timch)
#define DEF_TIM_AF__D(af_n, tim_n)    GPIO_AF ## af_n

// DMA is deliberately disabled for the first PWM-capable CH32 target. DShot
// and DMA timer bursts need a CH32 DMA descriptor table before they are safe.
#define DEF_TIM_DMA__BTCH_TIM1_CH1    NONE
#define DEF_TIM_DMA__BTCH_TIM1_CH2    NONE
#define DEF_TIM_DMA__BTCH_TIM1_CH3    NONE
#define DEF_TIM_DMA__BTCH_TIM1_CH4    NONE

#define DEF_TIM_DMA__BTCH_TIM8_CH1    NONE
#define DEF_TIM_DMA__BTCH_TIM8_CH2    NONE
#define DEF_TIM_DMA__BTCH_TIM8_CH3    NONE
#define DEF_TIM_DMA__BTCH_TIM8_CH4    NONE

#define DEF_TIM_DMA__BTCH_TIM1_UP     NONE
#define DEF_TIM_DMA__BTCH_TIM8_UP     NONE

// AF table for CH32_UAV motor outputs.
#define DEF_TIM_AF__PA9__TCH_TIM1_CH2     D(1, 1)
#define DEF_TIM_AF__PA10__TCH_TIM1_CH3    D(1, 1)

#define DEF_TIM_AF__PC6__TCH_TIM8_CH1     D(3, 8)
#define DEF_TIM_AF__PC7__TCH_TIM8_CH2     D(3, 8)
#define DEF_TIM_AF__PC8__TCH_TIM8_CH3     D(3, 8)
#define DEF_TIM_AF__PC9__TCH_TIM8_CH4     D(3, 8)
