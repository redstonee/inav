/*
 * CH32H417/H415 interrupt-driven UART support.
 */

#include <stdbool.h>
#include <stdint.h>

#include "platform.h"

#include "drivers/io.h"
#include "drivers/nvic.h"
#include "drivers/rcc.h"
#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "drivers/serial_uart_impl.h"

#define UART_RX_BUFFER_SIZE UART1_RX_BUFFER_SIZE
#define UART_TX_BUFFER_SIZE UART1_TX_BUFFER_SIZE
#define CH32_IRQ_HANDLER(name) void name(void) CH32_IRQ_HANDLER_ATTR; void name(void)

typedef struct uartDevice_s {
    USART_TypeDef *dev;
    uartPort_t port;
    ioTag_t rx;
    ioTag_t tx;
    volatile uint8_t rxBuffer[UART_RX_BUFFER_SIZE];
    volatile uint8_t txBuffer[UART_TX_BUFFER_SIZE];
    rccPeriphTag_t rcc;
    uint8_t af;
    IRQn_Type irq;
    uint32_t irqPriority;
} uartDevice_t;

#ifdef USE_UART1
static uartDevice_t uart1 = {
    .dev = USART1,
    .rx = IO_TAG(UART1_RX_PIN),
    .tx = IO_TAG(UART1_TX_PIN),
    .rcc = RCC_AHB2(USART1),
    .af = GPIO_AF7,
    .irq = USART1_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART2
static uartDevice_t uart2 = {
    .dev = USART2,
    .rx = IO_TAG(UART2_RX_PIN),
    .tx = IO_TAG(UART2_TX_PIN),
    .rcc = RCC_AHB1(USART2),
    .af = GPIO_AF7,
    .irq = USART2_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART3
static uartDevice_t uart3 = {
    .dev = USART3,
    .rx = IO_TAG(UART3_RX_PIN),
    .tx = IO_TAG(UART3_TX_PIN),
    .rcc = RCC_AHB1(USART3),
    .af = GPIO_AF7,
    .irq = USART3_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART4
static uartDevice_t uart4 = {
    .dev = USART4,
    .rx = IO_TAG(UART4_RX_PIN),
    .tx = IO_TAG(UART4_TX_PIN),
    .rcc = RCC_AHB1(USART4),
    .af = GPIO_AF7,
    .irq = USART4_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART5
static uartDevice_t uart5 = {
    .dev = USART5,
    .rx = IO_TAG(UART5_RX_PIN),
    .tx = IO_TAG(UART5_TX_PIN),
    .rcc = RCC_AHB1(USART5),
    .af = GPIO_AF7,
    .irq = USART5_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART6
static uartDevice_t uart6 = {
    .dev = USART6,
    .rx = IO_TAG(UART6_RX_PIN),
    .tx = IO_TAG(UART6_TX_PIN),
    .rcc = RCC_AHB1(USART6),
    .af = GPIO_AF8,
    .irq = USART6_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART7
static uartDevice_t uart7 = {
    .dev = USART7,
    .rx = IO_TAG(UART7_RX_PIN),
    .tx = IO_TAG(UART7_TX_PIN),
    .rcc = RCC_AHB1(USART7),
    .af = GPIO_AF7,
    .irq = USART7_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

#ifdef USE_UART8
static uartDevice_t uart8 = {
    .dev = USART8,
    .rx = IO_TAG(UART8_RX_PIN),
    .tx = IO_TAG(UART8_TX_PIN),
    .rcc = RCC_AHB1(USART8),
    .af = GPIO_AF7,
    .irq = USART8_IRQn,
    .irqPriority = NVIC_PRIO_SERIALUART,
};
#endif

static uartDevice_t *uartHardwareMap[] = {
#ifdef USE_UART1
    &uart1,
#else
    NULL,
#endif
#ifdef USE_UART2
    &uart2,
#else
    NULL,
#endif
#ifdef USE_UART3
    &uart3,
#else
    NULL,
#endif
#ifdef USE_UART4
    &uart4,
#else
    NULL,
#endif
#ifdef USE_UART5
    &uart5,
#else
    NULL,
#endif
#ifdef USE_UART6
    &uart6,
#else
    NULL,
#endif
#ifdef USE_UART7
    &uart7,
#else
    NULL,
#endif
#ifdef USE_UART8
    &uart8,
#else
    NULL,
#endif
};

static void uartIrqHandler(uartPort_t *s)
{
    if (USART_GetITStatus(s->USARTx, USART_IT_RXNE) == SET) {
        const uint8_t ch = USART_ReceiveData(s->USARTx);

        if (s->port.rxCallback) {
            s->port.rxCallback(ch, s->port.rxCallbackData);
        } else {
            s->port.rxBuffer[s->port.rxBufferHead] = ch;
            s->port.rxBufferHead = (s->port.rxBufferHead + 1) % s->port.rxBufferSize;
        }
    }

    if (USART_GetITStatus(s->USARTx, USART_IT_TXE) == SET) {
        if (s->port.txBufferTail != s->port.txBufferHead) {
            USART_SendData(s->USARTx, s->port.txBuffer[s->port.txBufferTail]);
            s->port.txBufferTail = (s->port.txBufferTail + 1) % s->port.txBufferSize;
        } else {
            USART_ITConfig(s->USARTx, USART_IT_TXE, DISABLE);
        }
    }

    if (USART_GetITStatus(s->USARTx, USART_IT_ORE) == SET) {
        USART_ClearITPendingBit(s->USARTx, USART_IT_ORE);
    }
}

void uartGetPortPins(UARTDevice_e device, serialPortPins_t *pins)
{
    uartDevice_t *uart = uartHardwareMap[device];

    if (uart) {
        pins->txPin = uart->tx;
        pins->rxPin = uart->rx;
    } else {
        pins->txPin = IO_TAG(NONE);
        pins->rxPin = IO_TAG(NONE);
    }
}

void uartClearIdleFlag(uartPort_t *s)
{
    (void)s->USARTx->STATR;
    (void)s->USARTx->DATAR;
}

uartPort_t *serialUART(UARTDevice_e device, uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    uartDevice_t *uart = uartHardwareMap[device];

    if (!uart) {
        return NULL;
    }

    uartPort_t *s = &uart->port;
    s->port.vTable = uartVTable;
    s->port.baudRate = baudRate;
    s->port.rxBuffer = uart->rxBuffer;
    s->port.txBuffer = uart->txBuffer;
    s->port.rxBufferSize = sizeof(uart->rxBuffer);
    s->port.txBufferSize = sizeof(uart->txBuffer);
    s->USARTx = uart->dev;

    RCC_ClockCmd(uart->rcc, ENABLE);

    IO_t tx = IOGetByTag(uart->tx);
    IO_t rx = IOGetByTag(uart->rx);

    if (options & SERIAL_BIDIR) {
        IOInit(tx, OWNER_SERIAL, RESOURCE_UART_TXRX, RESOURCE_INDEX(device));
        IOConfigGPIOAF(tx, (options & SERIAL_BIDIR_PP) ? IOCFG_AF_PP : IOCFG_AF_OD, uart->af);
    } else {
        if (mode & MODE_TX) {
            IOInit(tx, OWNER_SERIAL, RESOURCE_UART_TX, RESOURCE_INDEX(device));
            IOConfigGPIOAF(tx, IOCFG_AF_PP, uart->af);
        }

        if (mode & MODE_RX) {
            IOInit(rx, OWNER_SERIAL, RESOURCE_UART_RX, RESOURCE_INDEX(device));
            IOConfigGPIOAF(rx, IOCFG_IPU, uart->af);
        }
    }

    NVIC_SetPriority(uart->irq, uart->irqPriority);
    NVIC_EnableIRQ(uart->irq);

    return s;
}

#ifdef USE_UART1
uartPort_t *serialUART1(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_1, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART1_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_1]->port);
}
#endif

#ifdef USE_UART2
uartPort_t *serialUART2(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_2, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART2_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_2]->port);
}
#endif

#ifdef USE_UART3
uartPort_t *serialUART3(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_3, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART3_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_3]->port);
}
#endif

#ifdef USE_UART4
uartPort_t *serialUART4(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_4, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART4_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_4]->port);
}
#endif

#ifdef USE_UART5
uartPort_t *serialUART5(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_5, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART5_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_5]->port);
}
#endif

#ifdef USE_UART6
uartPort_t *serialUART6(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_6, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART6_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_6]->port);
}
#endif

#ifdef USE_UART7
uartPort_t *serialUART7(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_7, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART7_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_7]->port);
}
#endif

#ifdef USE_UART8
uartPort_t *serialUART8(uint32_t baudRate, portMode_t mode, portOptions_t options)
{
    return serialUART(UARTDEV_8, baudRate, mode, options);
}

CH32_IRQ_HANDLER(USART8_IRQHandler)
{
    uartIrqHandler(&uartHardwareMap[UARTDEV_8]->port);
}
#endif
