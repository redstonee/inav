/*
 * CH32H417/H415 first-stage system bring-up for the INAV port.
 */

#include <stdbool.h>
#include <stdint.h>

#include "platform.h"

#include "drivers/system.h"
#include "drivers/time.h"

void enableGPIOPowerUsageAndNoiseReductions(void)
{
    RCC_HBPeriphClockCmd(
        RCC_HBPeriph_DMA1 |
        RCC_HBPeriph_DMA2 |
        RCC_HBPeriph_CRC,
        ENABLE);

    RCC_HB2PeriphClockCmd(
        RCC_HB2Periph_AFIO |
        RCC_HB2Periph_GPIOA |
        RCC_HB2Periph_GPIOB |
        RCC_HB2Periph_GPIOC |
        RCC_HB2Periph_GPIOD |
        RCC_HB2Periph_GPIOE |
        RCC_HB2Periph_GPIOF |
        RCC_HB2Periph_ADC1 |
        RCC_HB2Periph_ADC2 |
        RCC_HB2Periph_TIM1 |
        RCC_HB2Periph_SPI1 |
        RCC_HB2Periph_TIM8 |
        RCC_HB2Periph_USART1 |
        RCC_HB2Periph_I2C4 |
        RCC_HB2Periph_TIM9 |
        RCC_HB2Periph_TIM10 |
        RCC_HB2Periph_TIM11 |
        RCC_HB2Periph_TIM12,
        ENABLE);

    RCC_HB1PeriphClockCmd(
        RCC_HB1Periph_TIM2 |
        RCC_HB1Periph_TIM3 |
        RCC_HB1Periph_TIM4 |
        RCC_HB1Periph_TIM5 |
        RCC_HB1Periph_TIM6 |
        RCC_HB1Periph_TIM7 |
        RCC_HB1Periph_SPI2 |
        RCC_HB1Periph_SPI3 |
        RCC_HB1Periph_SPI4 |
        RCC_HB1Periph_USART2 |
        RCC_HB1Periph_USART3 |
        RCC_HB1Periph_USART4 |
        RCC_HB1Periph_USART5 |
        RCC_HB1Periph_USART6 |
        RCC_HB1Periph_USART7 |
        RCC_HB1Periph_USART8 |
        RCC_HB1Periph_I2C1 |
        RCC_HB1Periph_I2C2 |
        RCC_HB1Periph_I2C3 |
        RCC_HB1Periph_PWR,
        ENABLE);

    GPIO_InitTypeDef init;
    GPIO_StructInit(&init);
    init.GPIO_Pin = GPIO_Pin_All;
    init.GPIO_Speed = GPIO_Speed_Low;
    init.GPIO_Mode = GPIO_Mode_IN_FLOATING;

    init.GPIO_Pin &= ~(GPIO_Pin_13 | GPIO_Pin_14);
    GPIO_Init(GPIOA, &init);

    init.GPIO_Pin = GPIO_Pin_All;
    GPIO_Init(GPIOB, &init);
    GPIO_Init(GPIOC, &init);
    GPIO_Init(GPIOD, &init);
    GPIO_Init(GPIOE, &init);
    GPIO_Init(GPIOF, &init);
}

bool isMPUSoftReset(void)
{
    return (cachedRccCsrValue & RCC_SFTRSTF) != 0;
}

uint32_t systemBootloaderAddress(void)
{
    return 0;
}

static void ch32SysTickConfig(uint32_t ticks)
{
    SysTick0->ISR &= ~(1 << 1);
    SysTick1->CMP = ticks;
    SysTick1->CNT = 0;
    SysTick1->CTLR = 0xF;

    NVIC_SetPriority(SysTick1_IRQn, 0);
    NVIC_EnableIRQ(SysTick1_IRQn);
}

void systemInit(void)
{
    SystemAndCoreClockUpdate();

    cachedRccCsrValue = RCC->RSTSCKR;
    RCC_ClearFlag();

    enableGPIOPowerUsageAndNoiseReductions();

    cycleCounterInit();

    ch32SysTickConfig((SystemCoreClock / 1000U) - 1U);
}
