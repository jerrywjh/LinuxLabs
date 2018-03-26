# 实验2 VIM编辑器
## 实验目的
1. 掌握vi编辑器的进入与退出方法。 
2. 了解文本编辑器的三种模式。
3. 掌握使用vi编辑器进行编辑、选择及操作文本文件的命令
## 实验内容

### （一）
 1. 使用 vim 新建一个名为 vmware.txt 的空文件，录入下面文字，并保存。
 
> VMware Workstation User's Manual is available from the Help menu. The VMware Guest Operating System Installation Guide is available from the Help menu and provides information about installing specific guest operating systems in your virtual machines. The latest product documentation, including the latest versions of the user's manual and guest installation. 

2. 将 Workstation 的 W 改为小写字母。 

光标定位到 w 上。 确认处于命令模式。按 x(小写)删除 W，然后按 i 键，切换到编辑状态。 输入 w。

3. 将第一行文字删除。 

将光标定位到第一行，然后用 dd 命令就可删除。 

4. 插入一行 

将光标定位到第二自然段的最后，输入小写字母 o, 在光标位置下面插入一行。 

5. 查找字符 menu 

按esc 切换到命令模式, 输入/menu 然后按回车，光标定位到 menu 字 符上，按字母 n 键，找到下一个。 

6. 存盘退出

### （二） 
1. 在当前用户默认工作目录下新建一个名为“test”的目录。 
2. 将文件“/etc/rsyslog.conf”复制到“test”目录下。 
3. 使用vim 打开“test ”目录下的rsyslog.conf。
4. 指出$WorkDirectory /var/... 的所在行号。 
5. 将光标移到该行，并复制该行内容。 
6. 将该行内容内容粘贴至最后一行。 
7. 撤销第6步的动作。
8. 光标移到第31行，删除该行。 
9. 存盘但不退出。
10. 将光标移到首行，插入模式下输入“Hello,this is vi world!”。 
11. 向下查找字符串“syslog”。 
12. 再向上查找字符串“TCP”。 
13. 强制退出vi，不存盘。

### (三）
找到你以前的一个用Java/Javascript/HTML/C/PHP或是其他语言编写的程序，要求这个程序代码不少于200行。
重新用vim来编写这个程序。
要求：
1. 从头开始一句一句的录入。
2. 任何拼写和语法错误都要改正好。
3. 任何不了解的操作，请查阅vim相关的帮助（在线或书本都可以）

## VIM 操作
参阅鸟哥LINUX的第10章
