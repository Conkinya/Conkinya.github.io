# Q&A常见疑问

> [!WARNING]
> 严禁修改系统分区、严禁使用修改系统分区的App或模块、严禁尝试用越狱ksu转magisk，如果您不具备风险应对能力，请勿阅读本教程、请勿使用此漏洞！

> [!NOTE]
> 侵权请致邮件至mail@jiayv.wang，我将妥善处理此事。
教程来自网络整合，主要来自酷安@上善若水、@xingguangcuican，在此一并致谢。

**Q：我的小米XXX可以吗？**
A：自己对照
设备：小米红米
芯片：骁龙8gen2及以上
Android安全更新版本：低于2026年2月1日（不含）
系统版本：澎湃OS2、3，澎湃OS1不可以

**Q：文件在哪**
A：新版视频演示版本【KernelSU.apk】
链接：https://qfile.qq.com/q/8UWMIkbi8w
**如果失效代表时效性很差，请自行前往以下地址搜寻。**
KernelSU：https://github.com/tiann/KernelSU
MKSU：https://t.me/mksu_ci

**Q：无法将fastboot识别为……（命令爆红）**
A：自行安装驱动，如下

**Q：柚坛工具箱在哪下？怎么用**
A：[https://toolbox.uotan.cn/](https://toolbox.uotan.cn/)
`Gmeek-html<img src="https://pic.jiayv.wang/file/shit/WsqzKi7j.webp" alt="Uotan" width=100% />`

**Q：一加设备可以吗**
A：可以，但是我不懂

**Q：命令发一下**
A：fastboot oem set-gpu-preemption 0 androidboot.selinux=permissive ##设置SELinux宽容，每次开机都要执行
fastboot continue ##在FASTBOOT中直接引导系统，每次开机都要执行
别复制到空格了

Q：怎么操作？
A：请看视频
`Gmeek-html<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=116215641019858&bvid=BV1vpckzhEdH&cid=36646879270&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" width="100%" height="460px"></iframe>`

**Q：一键脚本在哪？**
A：请见文章末尾

**Q：目前可以有哪些操作哦，这样root的不能恢复，不是很敢试了**
A：严禁修改系统分区、严禁使用修改系统分区的App或模块、严禁尝试用越狱ksu转magisk等

>[!NOTE]
>可以恢复，删除/data/adb/和/data/local/tmp/中的文件以全身而退。另外每次开机SELinux都会默认严格状态。无需担心！

**Q：会清除数据吗、会格式化吗？**
A：不会

**Q：可以自行修改系统证书吗？**
A：严禁直接修改system中的任何内容，但是可以在内存层面利用root管理器的system overlay mount进行修改

# 报错
>如果您遇到了这些情况：
- [x] 首先需要确定安装好adb和fastboot驱动
- [x] 确定你的设备状况存在漏洞
- [x] 确定进的是fastboot不是fastbootd

**1.需要打开开发者选项中的OEM解锁**
`Gmeek-html<img src="https://pic.jiayv.wang/file/shit/1773373791698_1773373757532.webp" alt="1773373757532.png" width=100% />`

**2.waiting for any device？**
执行`fastboot oem set-gpu-preemption 0 androidboot.selinux=permissive`后，提示< waiting for any device >怎么办 进fastboot了

**已知办法之一：重新安装adb驱动**

**3.系统自动重启到了Recovery并有红字？**
进入宽容模式后 系统会运行一会 然后直接重启到Recovery 接着底部红字提示`system crashed multiple times rescue patry activated`

因为ksu的自动越狱 ksu检测到宽容就会开始越狱 越狱完成要重启系统框架 短时间系统框架多次重启系统就会觉得自己死了进rec

# 自动脚本.bat
**请创建一个.bat文件，以ANSI编码保存**，不可以是UTF-8
`@echo off
chcp 936 >nul
title  SELinux自动宽容脚本
echo ==================================================
echo     SELinux自动宽容脚本
echo ==================================================
echo 本脚本将引导您完成临时Root，请确保：
echo  1.您的设备存在漏洞
echo  2.如果稍后fastboot oem命令失败，请打开开发者选项中的OEM解锁
echo  3. 电脑已安装 adb 和 fastboot 驱动
echo.
pause
cls

fastboot devices | find "fastboot" >nul
if errorlevel 1 (
    adb reboot bootloader
echo [等待]设备进入fastboot后点击任意键。
    pause
)
echo [成功] 设备已进入Fastboot。

echo 发送fastboot指令：设置selinux为宽容模式并继续启动...
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
echo [成功] 设备正在重启，请稍候...

adb wait-for-device
echo [成功] ADB设备已连接。

:: 等待屏幕解锁（通过检测 /sdcard/Android 目录是否存在）
echo 检测屏幕解锁状态，请确保马上解锁（输入密码进入桌面）...
:wait_unlock
adb shell test -d /sdcard/Android 1>nul 2>nul
if errorlevel 1 (
    timeout /t 1 >nul
    goto wait_unlock
)
echo [成功] 屏幕已解锁。
echo.
echo ==================================================
echo 已完成！
echo 接下来您要做的是：
echo   - 立即打开KernelSU点击“越狱按钮”
echo   - 教程分发者的联系方式：mail@jiayv.wang，修改自网络
echo ==================================================
pause`