**Q：我的小米XXX可以吗？**
A：自己对照
设备：小米红米
芯片：骁龙8gen系（我比较保守说不定别的也可以）
Android安全更新版本：低于2026年2月1日
系统版本：澎湃OS2、3

**Q：无法将fastboot识别为……（命令爆红）**
A：自行安装驱动，如下

**Q：柚坛工具箱在哪下？怎么用**
A：[https://toolbox.uotan.cn/](https://toolbox.uotan.cn/)
`Gmeek-html<img src="https://pic.jiayv.wang/file/shit/WsqzKi7j.webp" alt="Uotan" width=100% />`

Q：一加设备可以吗
A：可以，但是我不懂

Q：命令发一下
A：fastboot oem set-gpu-preemption 0 androidboot.selinux=permissive ##设置SELinux宽容，每次开机都要执行
fastboot continue ##在FASTBOOT中直接引导系统，每次开机都要执行
别复制到空格了