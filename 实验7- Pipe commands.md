# 实验7 Pipe and filter commands
## 实验目的
熟悉 cut, grep, sort, wc, uniq, tee, tr, xargs, sed, awk 等命令的用法
## 实验内容

1. cut 
列出系统中所有的用户名
> cut -d':' -f1 /etc/passwd

当然也可以用：
> cat /etc/passwd | cut -d':' -f1



2. grep
