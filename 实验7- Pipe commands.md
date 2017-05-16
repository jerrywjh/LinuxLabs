# 实验7 Pipe and filter commands
## 实验目的
熟悉 cut, grep, sort, wc, uniq, tee, tr, xargs, sed, awk 等命令的用法
## 实验内容

1. cut 
cut的几个主要参数：
-d  --delimiter: 分隔符
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
