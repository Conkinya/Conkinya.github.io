@echo off
chcp 936 >nul
title KernelSU 临时Root工具
echo ==================================================
echo     闪电 KernelSU 临时Root工具 (适用于小米高通机型)
echo ==================================================
echo 本脚本将引导您完成临时Root，请确保：
echo  原创作者的QQ群1080071287，教程分发者的联系方式：mail@jiayv.wang
echo  1. 手机已进入 Fastboot 模式并连接电脑
echo  2. 当前目录下存在 ksud 文件（普通版或改包名版）
echo  3. 电脑已安装 adb 和 fastboot 驱动
echo.
pause
cls

if not exist "ksud" (
    echo [错误] 未找到 ksud 文件，请将其放置在本脚本同目录下。
    pause
    exit /b 1
)

fastboot devices | find "fastboot" >nul
if errorlevel 1 (
    echo [错误] 未检测到Fastboot设备，请确保手机已进入Fastboot模式并连接电脑。
    pause
    exit /b 1
)
echo [成功] 检测到Fastboot设备。

echo [步骤1/7] 发送fastboot指令：设置selinux为宽容模式并继续启动...
fastboot oem set-gpu-preemption 0 androidboot.selinux=permissive
if errorlevel 1 (
    echo [警告] fastboot oem命令可能失败，继续尝试...
) else (
    echo [成功] 已发送selinux宽容模式指令。
)

fastboot continue
if errorlevel 1 (
    echo [错误] fastboot continue 失败，请检查手机状态。
    pause
    exit /b 1
)
echo [成功] 手机正在重启，请稍候...

adb wait-for-device
echo [成功] ADB设备已连接。

:: 等待屏幕解锁（通过检测 /sdcard/Android 目录是否存在）
echo [步骤2/7] 检测屏幕解锁状态，请确保手机已解锁（输入密码进入桌面）...
:wait_unlock
adb shell test -d /sdcard/Android 1>nul 2>nul
if errorlevel 1 (
    timeout /t 1 >nul
    goto wait_unlock
)
echo [成功] 屏幕已解锁。

echo [步骤3/7] 推送 ksud 到 /data/local/tmp 并设置权限...
adb push ksud /data/local/tmp/
if errorlevel 1 (
    echo [错误] 推送失败，请检查ADB连接。
    pause
    exit /b 1
)
adb shell chmod 777 /data/local/tmp/ksud
echo [成功] 已推送并赋予执行权限。

echo [步骤4/7] 尝试加载KernelSU模块...
adb shell service call miui.mqsas.IMQSNative 21 i32 1 s16 "/data/local/tmp/ksud" i32 1 s16 "late-load" s16 "/sdcard/ksulog.txt" i32 60
if errorlevel 1 (
    echo [警告] service call 执行可能失败，请继续后续步骤观察。
) else (
    echo [成功] KernelSU模块加载指令已发送。
)

echo.
echo [步骤5/7] 请在手机上打开 KernelSU 管理器，授予 Shell Root 权限。
echo      如果未出现授权弹窗，请手动打开 KernelSU 应用查看。
pause

echo [步骤6/7] 恢复 SELinux 为强制模式...
adb shell su -c setenforce 1
if errorlevel 1 (
    echo [错误] 恢复 SELinux 失败，请检查 Root 权限是否已授予。
) else (
    echo [成功] SELinux 已恢复为强制模式。
)

echo.
echo ==================================================
echo 临时Root过程已完成！
echo 接下来您可以：
echo   - 安装 ZygiskNext 和 LSPosed 模块（手动操作）
echo   - 重启后 Root 会失效，需重新运行本脚本
echo   - 如需使用改包名版本，请将 ksud 替换为对应版本
echo ==================================================
pause