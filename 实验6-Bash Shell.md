
# 实验6 Bash Shell
## 实验目的
1. 熟悉Bash的变量和环境的相关设置
2. 熟悉相关命令的使用
## 实验内容
1. 查看系统的环境变量
> env

这个命令会显示系统所有的 environment variables. 比如:

PATH： 路径的环境变量

HOSTNAME： 主机名的环境变量

USER： 当前用户

。。。。

要查看一个具体的变量的值，比如PATH
> echo $PATH   

需要注意的是：变量在被使用／引用的时候，需要在前面加上$, 或者 ${变量}， 比如： echo ${PATH},  这样PATH才会被认为是个变量， 而不是个命令

2. 查看所有变量，包括环境变量和自定义变量
> set

> set | less      (分页显示)

这个set命令会显示目前系统中所有变量，包括env命令显示的环境变量，加上Bash的各个初始化脚本声明的各种自定义变量和函数

如果要查询某个具体的变量的值，比如PS1的值：
> set | grep PS1

当然也可以用： 
> echo $PS1

3. 查看目前系统使用的alias
> alias

很多linux的版本中都有 alias ll='ls -l --color=auto' 这样的alias， 在这种情况下，输入ll就 相当于输入 ls -l --color=auto

4. 设置一个alias并测试
> cls

> alias cls='clear'

> cls

5. 取消刚才的alias设置
> cls

> unalias cls

> cls

6. 使用PS1修改 Bash的提示符
查看 PS1的值：
> echo $PS1

修改PS1:
> PS1='YANTAI UNIV->'

观察一下目前的命令提示符，是不是改变了。

修改PS1回原来的值， 比如：
> PS1='[\u@\h \W]$ '

其中的转义字符的意思，可以通过 man bash来查找，具体如下

\u: 目前用户账号

\h: 主机名

\W: 目录名 （不是完整路径，只是最后一个目录的名字）

\w: 完整的路径名

7. 查看bash命令的历史
> history

> history 10

> cat ~/.bash_history

两者为什么不一致？ 什么关系？

每次你退出bash的时候，命令的history会被写入.bash_history文件， .bash_history实际上保存的是你上次的操作记录。

8. 查看bash的各种初始化文件, 包括:

/etc/profile  

/etc/profile.d/*.sh  （和/etc/profile的关系？阅读一下/etc/profile的代码）

~/.bash_profile

~/.bashrc

大家可以仔细阅读一下这几个文件的代码，了解一下他们都做了什么，他们之间的关系。




