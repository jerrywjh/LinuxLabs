# 实验1 常用命令的了解和使用
## 实验目标
熟悉基本命令,使用基本的命令执行基本的 Linux 任务和命令。
## 实验内容：
1. **系统登录**

开机后，打开VMWare软件，选择Redhat操作系统，点击开机，进入Linux系统。 系统启动后无论是GUI界面还是Console界面，都会要求输入用户名和密码，图形界面下，用户名：root，密码：computer。 

如果你进入的是图形话的GNOME或KDE界面，找到Terminal（或Konsole）程序，我们后面所有的实验都会基于命令行界面，不会使用图形界面。

2. **ls命令**

ls命令查看当前目录中的文件和子目录

输入ls，查看结果，配合cd命令进入其他目录，可以查看所有目录的内容。

如何查看文件的更加详细的信息？  
>ls -l

>ls -a
查看所有文件，包括隐藏文件  

>ls –-help 
查看该命令的帮助。 

如果你是第一次用Linux，请仔细阅读一些常用命令的帮助文档。根据帮助文档的内容，尝试ls的其他参数的用法

用cd命令进入其他目录 ， 然后用ls命令查看不同目录的内容

3. **cat命令**

cat用来查看文件内容。

 
>**cat /etc/crontab**   显示/etc/crontab文件的内容

>**cat -n /etc/passwd**  显示内容和行号

>**cat /bin/date**

查看非文本文件。由于date文件不是文本文件，而是binary文件，因此无法用cat命令来显示。

4. **ps 命令**

ps : （Process Status） 查看进程状态的命令

>ps aux  查看系统所有的进程数据，这个命令很常用。

在显示的结果中，各个字段的意义如下：

- USER： 该进程属于哪个用户
- PID： 进程ID，这个非常重要， Linux很多操作进程的指令都是根据PID来操作的
- %CPU： 该进程占用的CPU资源百分比
- %MEM： 该进程占用的内存资源百分比
- VSZ：该进程使用的虚拟内存（KB）
- RSS： 该进程使用的固定内存量（KB）
- TTY：该进程运行在哪个terminal上
- STAT： 进程状态： S：sleep， R：running    T：stop   。。。
- START：该进程启动的时间
- TIME：该进程使用的CPU的运行时间
- COMMAND： 该进程对应的命令

>ps -l  查看你自己bash相关的进程

>ps axjf  查看进程之间的树状关系, 这个命令也很常用

5. **man命令**

man: （manual） 查看命令的详细帮助
>man cat

在man的文档中，可以 上下左右 （或者hjkl键）和翻页等进行翻页 。如果要退出这个页面，按q键。
用man来查看你知道的几个命令的帮助文档。  强烈建议：至少仔细完整的阅读完2，3个命令的man page

6. **info 命令**

info作用和man基本是一样的，是GNU推荐的文档格式，加上了Hyperlink等格式。

>info man

>info cat

>info ls

7. **cp命令**

cp: （copy） 文件复制命令

>cp ~/.bashrc  /tmp/bashrc

说明：~代表用户的主目录， 用户login以后就处于这个目录下。缺省情况下，该用户对于该目录具有所有操作的权限。 比如：root用户的主目录就是 /root ， 而computer用户的主目录就是/home/computer.

>cp -r  /usr/include/net     ~/

把/usr/include/net这个目录整体copy 到当前用户的主目录下

-r : Recursive 递归

>cp -p ~/.bashrc  /tmp/bashrc2  把文件连同属性一起copy

说明：普通的cp命令会改变文件的属性 （所有者，权限等都会变成给操作者相关的） 有的时候（比如备份时），我们需要保持文件的原生属性，这时候就要用p参数

你可以看一下 /tmp/bashrc 和/tmp/bashrc2有何不同

8. **rm命令**

rm: (Remove)删除文件

>rm /tmp/bashrc

>mkdir /tmp/testdir      然后  rm -r /tmp/testdir

需要注意的是： rm是直接删除，没有垃圾箱的概念。非常危险，用的时候要格外小心。

**说明**：以上这些命令都是Linux中最常用的命令，务必需要掌握。各种命令中的参数，不需要全部记住，用到的时候通过查看帮助来选择正确的参数。

9. **more/less命令**
more 和 less 命令可以用上下翻页的方式来查看文件。比如一个文件的内容比较长，用cat命令会一下子显示到最后一页，而用more或者less命令就可以一屏一屏的显示。
比如要查看/etc/passwd的内容，可以用以下任何一种命令：
> more /etc/passwd

> less /etc/passwd

> cat /etc/passwd | more

> cat /etc/passed | less

10. **head/tail命令**


