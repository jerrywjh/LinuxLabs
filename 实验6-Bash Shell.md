
# 实验6 Bash Shell
## 实验目的
1. 熟悉Bash的变量和环境的相关设置
2. 熟悉相关命令的使用
## 实验内容
1. 查看系统的环境变量
> env

这个命令会显示系统所有的 environment variables. 比如
PATH： 路径的环境变量
HOSTNAME： 主机名的环境变量
USER： 当前用户
。。。。

要查看一个具体的变量的值，比如PATH
> echo $PATH




1. 查看目前系统使用的alias
> alias

很多linux的版本中都有 alias ll='ls -l --color=auto' 这样的alias， 在这种情况下，输入ll就 相当于输入 ls -l --color=auto

2. 设置一个alias并测试
> cls

> alias cls='clear'

> cls

3. 取消刚才的alias设置
> cls

> unalias cls

> cls

4. 使用PS1修改 Bash的提示符

3. 数据流重定向

