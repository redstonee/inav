# CH32H415REU6 INAV 飞控移植说明

这是基于 `iNavFlight/inav` 移植到 `CH32H415REU6` 的飞控固件工程。当前工程用于你的 CH32_UAV 飞控板，芯片按 `CH32H415REU6` 处理。

## 当前状态

- 目标芯片：`CH32H415REU6`
- INAV 版本显示：`9.0.1 [CH32H415REU6]`
- USB CDC：已验证，Windows 下为 `COM7`
- WCH-Link 串口：`COM6`，这是调试器串口，不是 INAV 连接口
- MSP 通信：已验证正常
- hardfloat 固件：已验证启动正常
- CPU 负载：hardfloat 版本下 MSP 读取约 `8%`
- 当前不要接电池和桨，调试阶段只用 USB/WCH-Link

## 目录位置

工程源码：

```text
C:\Users\30296\Desktop\ch32\inav_ch32h415reu6_port
```

沁恒官方资料和源码：

```text
C:\Users\30296\Desktop\ch32\CH32H415_WCH_Official
```

原理图资料：

```text
C:\Users\30296\Desktop\ch32\原理图
```

立创 EDA 工程参考资料：

```text
C:\Users\30296\Desktop\ch32\_eda_CH32_UAV_latest
```

## 推荐烧录固件

当前推荐使用已经验证的 hardfloat 固件：

```text
C:\CH32_FLASH\CH32H415_hardfloat_verified_20260526\CH32H415REU6_hardfloat_verified_dual.bin
```

同目录还有 hex：

```text
C:\CH32_FLASH\CH32H415_hardfloat_verified_20260526\CH32H415REU6_hardfloat_verified_dual.hex
```

如果 hardfloat 版本需要回退，可用已知能通信的软浮点版本：

```text
C:\CH32_FLASH\CH32H415_msp_scheduler_nostarve_20260526\CH32H415REU6_msp_scheduler_nostarve_dual.bin
```

## WCH-LinkUtility 烧录方法

打开：

```text
C:\MounRiver\MounRiver_Studio2\resources\app\resources\win32\components\WCH\Others\SWDTool\default\WCH-LinkUtility.exe
```

设置：

- Core：`RISC-V`
- Series：`CH32H41X`
- Addr：`8000000`
- 勾选：`Erase All`
- 勾选：`Program`
- 勾选：`Verify`
- 勾选：`Reset and Run`
- 不要勾选 `Enable MCU Code Read-Protect`

菜单 `File -> Open Firmware`，选择推荐的 hardfloat `.bin` 文件，然后依次执行：

1. `Erase`
2. `Program`
3. `Verify`
4. `Reset`

烧录成功后，Windows 设备管理器应出现：

```text
USB 串行设备 (COM7)
```

## INAV Configurator 连接

连接飞控时选择：

```text
COM7
```

不要选：

```text
COM6
```

`COM6` 是 WCH-Link SERIAL，不是飞控 USB CDC。

如果 INAV Configurator 提示“混控没有配置，请到混控界面去设置”，这是配置区还没有完整飞控配置，不代表固件没跑。

## 已验证的 MSP 返回

hardfloat 固件烧录后，`COM7` 可正常返回：

```text
MSP_API_VERSION -> 正常
MSP_FC_VARIANT  -> INAV
MSP_STATUS_EX   -> CPU load 约 8%
```

## 编译 hardfloat 固件

构建目录：

```text
C:\Users\30296\Desktop\ch32\inav_ch32h415reu6_port\build_ch32h415_hardfloat_ninja
```

使用 MSYS2 bash 构建：

```bash
export PATH="/c/Users/30296/Desktop/CH32飞控/tools/wch-gcc/risc-none-embed-gcc-8.2.0/bin:$PATH"
cd /c/Users/30296/Desktop/ch32/inav_ch32h415reu6_port
cmake --build build_ch32h415_hardfloat_ninja --target CH32H415REU6.dual
```

hardfloat 编译参数：

```text
CH32_RISCV_ARCH=rv32imafcxw
CH32_RISCV_ABI=ilp32f
```

生成产物：

```text
build_ch32h415_hardfloat_ninja\inav_9.0.1_CH32H415REU6_dual.bin
build_ch32h415_hardfloat_ninja\inav_9.0.1_CH32H415REU6_dual.hex
```

## 关键修改点

- CH32H415REU6 目标配置
- UART6 AF 修正为 `GPIO_AF8`
- USB CDC/MSP 通信可用
- 调度器避免实时任务饿死串口/MSP
- `TASK_SERIAL` 优先级提高
- 默认 gyro/PID looptime 放宽，避免初始过载
- hardfloat 编译启用 `rv32imafcxw / ilp32f`
- 确认不再走 `__mulsf3 / __addsf3 / __divsf3` 软浮点热路径

## 常见问题

### 看不到 COM7

先检查是否只看到：

```text
COM6 = WCH-Link SERIAL
```

如果只有 COM6，通常是固件没有正确烧进去，或者烧录时 WCH-LinkUtility 选错了芯片系列。必须选择：

```text
CH32H41X
```

不要选择 `CH32V30X`。

### INAV 里保存默认设置等很久

当前配置保存走片上 Flash 模拟 EEPROM。第一次保存、擦写配置区、或者 Configurator 等待重启时可能会明显慢一些。

如果长时间不返回：

1. 等 30 秒
2. 关闭 INAV Configurator 连接
3. 拔插飞控 Type-C
4. 重新选择 `COM7` 连接

后续需要继续优化配置保存和重启流程。

### CPU 负载很高

旧固件是软浮点编译，INAV 的 PID/filter 浮点计算会跑进 `__mulsf3` 等软件浮点函数，所以 CPU load 会异常高。

当前 hardfloat 固件已解决这个问题，MSP 读取 CPU load 约 `8%`。

## 当前建议

下一步不要直接装桨试飞。建议顺序：

1. INAV Configurator 连接 `COM7`
2. 设置 Mixer
3. 检查陀螺仪方向
4. 校准加速度计
5. 检查电机输出和电机顺序
6. 检查接收机输入
7. 检查解锁条件
8. 最后再无桨电机测试
