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
A：暂无，马上就有了

**Q：目前可以有哪些操作哦，这样root的不能恢复，不是很敢试了**
A：严禁修改系统分区、严禁使用修改系统分区的App或模块、严禁尝试用越狱ksu转magisk等

>[!NOTE]
>可以恢复，删除/data/adb/和/data/local/tmp/中的文件以全身而退。另外每次开机SELinux都会默认严格状态。无需担心！

**Q：会清除数据吗、会格式化吗？**
A：不会

# 报错
>如果您遇到了这些情况：

**1.需要打开开发者选项中的OEM解锁**
`Gmeek-html<img src="https://pic.jiayv.wang/file/shit/1773373791698_1773373757532.webp" alt="1773373757532.png" width=100% />`

**2.waiting for any device？**
执行`fastboot oem set-gpu-preemption 0 androidboot.selinux=permissive`后，提示< waiting for any device >怎么办 进fastboot了

**已知办法之一：重新安装adb驱动**