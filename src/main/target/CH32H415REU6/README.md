# CH32H415REU6 目标说明

这个目标是面向 WCH `CH32H415REU6` 的 `CH32_UAV` 飞控移植版本。板级引脚映射来自本地立创 EDA `CH32_UAV` 工程和 `C:\Users\30296\Desktop\ch32` 下的原理图目录；提取后的固件侧网络映射见 `references/HARDWARE_MAP_CH32_UAV.md`。

当前已启用内容：

- USB VCP：使用 USBFS `PA11/PA12`，作为 INAV Configurator 的主 MSP 连接口
- BMI088 陀螺仪/加速度计，挂在 SPI1：`PA5/PA6/PA7`，陀螺 CS 为 `PA4`，加速度计 CS 为 `PC4`
- SPL06 气压计和 IST8310 磁力计，使用 `PA14/PA13` 上的软件 I2C
- USART2/3/4/5/6/7，其中 USART2 保留为 115200 MSP 兜底口，USART4 为默认 SBUS 接收机口
- USART4 接收端反相控制脚 `PE3`
- 6 路 PWM 电机输出：`PA10`、`PA9`、`PC9`、`PC6`、`PC7`、`PC8`
- 首次上电默认使用 Quad X 混控，输出在 PWM1-PWM4，PWM5/PWM6 预留给后续调整
- ADC1 + DMA 采样：`PB1` 采 VBAT，`PB0` 采电流
- 默认开启 VBAT 监测，分压按 21:1 处理
- 参数存储使用 V5F Flash 末尾 8 KiB 区域

当前仍刻意禁用：

- SDIO / blackbox：SDMMC 和 FATFS 适配还没有完成
- DShot / ESC sensor：定时器 DMA 路径还没有实测验证
- AW2023 RGB LED：不是首飞关键功能，暂不接入
- GPS 和 CLI：为了把首版 bring-up 固件控制在 CH32H415REU6 的 Flash 容量内，暂时关闭；配置通过 USB VCP 或 USART2 MSP 完成

默认串口说明：

- Type-C 连接电脑后应出现一个 USB 串口，INAV Configurator 连接这个串口即可
- USART2 `PA2/PA3` 仍保留为 115200 MSP 兜底口，方便 USB 调试失败时继续进入配置器
- 接收机默认仍按 USART4 上的 SBUS 处理

真正上机飞之前，仍需实测确认：

- BMI088 安装方向，当前 `IMU_BMI088_ALIGN` 还是 `CW0_DEG`
- Quad X 的电机顺序和 PWM 极性
- `PB0` 电流传感的比例和零点偏移
- 内部 Flash 参数区擦写是否长期稳定
- 接收机协议和串口是否最终仍使用 USART4 上的 SBUS
