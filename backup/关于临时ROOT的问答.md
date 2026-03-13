# Q&A常见疑问

> [!WARNING]
> 严禁修改系统分区、严禁使用修改系统分区的App或模块、严禁尝试用越狱ksu转magisk


**Q：我的小米XXX可以吗？**
A：自己对照
设备：小米红米
芯片：骁龙8gen系（我比较保守说不定别的也可以）
Android安全更新版本：低于2026年2月1日
系统版本：澎湃OS2、3

**Q：文件在哪**
A：𝕭𝖊𝖑𝖚𝖆通过QQ文件闪传分享了【KernelSU.apk】
链接：https://qfile.qq.com/q/8UWMIkbi8w

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

# 报错
>如果您遇到了这些情况：

**1.需要打开开发者选项中的OEM解锁**
`Gmeek-html<img src="https://pic.jiayv.wang/file/shit/1773373791698_1773373757532.webp" alt="1773373757532.png" width=100% />`


