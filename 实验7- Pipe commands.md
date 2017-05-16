# 实验7 Pipe and filter commands
## 实验目的
熟悉 cut, grep, sort, wc, uniq, tee, tr, xargs, sed, awk 等命令的用法
## 实验内容

1. cut 
cut的几个主要参数：

-d  --delimiter 分隔符

-f  --fields  字段／列

-c  --characters  字符

列出系统中所有的用户名
> cut -d ':' -f 1 /etc/passwd

当然也可以用：
> cat /etc/passwd | cut -d ':' -f 1

列出所有的环境变量及其值
> export | cut -c 12-

-c 12- ：从第12个字符往后的所有字符

2. grep
grep是个搜索类的命令，是linux中最常用的命令之一，支持正则表达式的搜索

grep的主要参数：

-i  --ignore-case  忽略大小写
-n  --line_number  显示行号
-r  --recursive   递归搜索，可以搜索子目录

查看/lib目录下，所有python文件中包含 "random"这个字符的代码行
> grep --include=*.py -nr random /lib

查找/etc/passwd中 root用户的那一行
> cat /etc/passwd | grep ^root  

注意：^root 是正则表达式，表示 以root开头的那一行

显示当前目录的所有子目录
> ls -l | grep ^d 

显示当前目录的所有文件，不显示子目录
> ls -l | grep -v ^d

-v 参数： 请查看帮助了解


