#include <stdint.h>

#include "platform.h"

#include "drivers/rcc.h"
#include "drivers/timer.h"
#include "drivers/timer_impl.h"

#define CH32_IRQ_HANDLER(name) void name(void) CH32_IRQ_HANDLER_ATTR; void name(void)

const timerDef_t timerDefinitions[HARDWARE_TIMER_DEFINITION_COUNT] = {
    { TIM1,  RCC_AHB2(TIM1),  TIM1_UP_IRQn, TIM1_CC_IRQn },
    { TIM2,  RCC_AHB1(TIM2),  TIM2_IRQn, 0 },
    { TIM3,  RCC_AHB1(TIM3),  TIM3_IRQn, 0 },
    { TIM4,  RCC_AHB1(TIM4),  TIM4_IRQn, 0 },
    { TIM5,  RCC_AHB1(TIM5),  TIM5_IRQn, 0 },
    { TIM6,  RCC_AHB1(TIM6),  TIM6_IRQn, 0 },
    { TIM7,  RCC_AHB1(TIM7),  TIM7_IRQn, 0 },
    { TIM8,  RCC_AHB2(TIM8),  TIM8_UP_IRQn, TIM8_CC_IRQn },
    { TIM9,  RCC_AHB2(TIM9),  TIM9_IRQn, 0 },
    { TIM10, RCC_AHB2(TIM10), TIM10_IRQn, 0 },
    { TIM11, RCC_AHB2(TIM11), TIM11_IRQn, 0 },
    { TIM12, RCC_AHB2(TIM12), TIM12_IRQn, 0 },
};

uint32_t timerClock(TIM_TypeDef *tim)
{
    (void)tim;
    return SystemCoreClock;
}

uint16_t timerGetPrescalerByDesiredMhz(TIM_TypeDef *tim, uint16_t mhz)
{
    (void)tim;
    if (mhz == 0) {
        return 0;
    }

    return (uint16_t)((SystemCoreClock / (mhz * 1000000U)) - 1U);
}

CH32_IRQ_HANDLER(TIM1_UP_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM1, timerCtx[0]);
}

CH32_IRQ_HANDLER(TIM1_CC_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM1, timerCtx[0]);
}

CH32_IRQ_HANDLER(TIM2_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM2, timerCtx[1]);
}

CH32_IRQ_HANDLER(TIM3_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM3, timerCtx[2]);
}

CH32_IRQ_HANDLER(TIM4_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM4, timerCtx[3]);
}

CH32_IRQ_HANDLER(TIM5_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM5, timerCtx[4]);
}

CH32_IRQ_HANDLER(TIM6_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM6, timerCtx[5]);
}

CH32_IRQ_HANDLER(TIM7_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM7, timerCtx[6]);
}

CH32_IRQ_HANDLER(TIM8_UP_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM8, timerCtx[7]);
}

CH32_IRQ_HANDLER(TIM8_CC_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM8, timerCtx[7]);
}

CH32_IRQ_HANDLER(TIM9_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM9, timerCtx[8]);
}

CH32_IRQ_HANDLER(TIM10_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM10, timerCtx[9]);
}

CH32_IRQ_HANDLER(TIM11_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM11, timerCtx[10]);
}

CH32_IRQ_HANDLER(TIM12_IRQHandler)
{
    impl_timerCaptureCompareHandler(TIM12, timerCtx[11]);
}
