# 实验7 Pipe and filter commands
## 实验目的
熟悉 cut, grep, sort, wc, uniq, tee, tr, xargs, sed, awk 等命令的用法
## 实验内容

1. cut 

Print selected parts of lines form a file to standard output.

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

注意：^root 是正则表达式，表示 以root头的那一行

显示当前目录的所有子目录
> ls -l | grep ^d 

显示当前目录的所有文件，不显示子目录
> ls -l | grep -v ^d

-v 参数： 请查看帮助了解

3. sort

参数：

-n  --numeric-sort : 按照纯数字的方式来排序

-b  --ignore-leading-blanks: 忽略前面的空格

-t  --field-separator: 分隔符，默认TAB

-k  --key: 排序的键的位置

对 /etc/passwd 中的数据按照用户名的升序排列
> cat /etc/passwd | sort

or
> sort /etc/passwd

对 /etc/passwd 中的数据按照 uId的升序排列
> cat /etc/passwd | sort -n -t ':' -k 3

说明： -k 3 ： 按照第三列来排序，第三列是uId 

4. wc 

print newline, word and byte counts for each file

参数：

-l --lines  仅显示行数

-w --words 仅显示单词数

-m --chars 仅显示字符数

查看系统日志的统计信息，包括有多少行，多少字，多少字符

> wc /var/log/messages 

or 

> cat /var/log/messages | wc

查看系统日志有多少行
> wc -l /var/log/messages

5. uniq 

remove duplicate lines from a sortd file

参数：
-i --ignore-case: 忽略大小写

-c --count: 显示重复了多少次

查看你使用Bash命令的历史，并统计每个命令的使用次数
> history | cut -c 7- | sort | uniq -c

具体命令如果不明白，用 man 来查看帮助

6. tee

Copy standard input to a file, and also to standard output

参数： 
-a  --append: 追加到文件中，而不是覆盖

显示当前目录的详细信息，并保存到aaa这个文件中
> ls -l | tee aaa

7. tr

Translate, squeeze, and/or delete characters from standard input, writing to standard output.

参数：

-d --delete : 删除字符

查看用户登录的信息，并把所有字母用大写显示
> last | tr [a-z] [A-Z]

or 

> last | tr [:lower:] [:upper:]

注意： 上面的两个命令都用到了正则表达式，如果对正则表达式不明白或遗忘了，重新查看相关的文档 

把Windows下的文本文件中的换行符 \n\r 转换成linux的换行符 \n 
> cat abc.txt | tr -d '\r' > abc.linux.txt

8. xargs

Run COMMAND with arguments read from input

删除当前目录和子目录中所有以 .tmp 结尾的文件
> find . -name "*.tmp" | xargs rm -rf

touch 当前目录的所有文件
> ls | xargs touch 

该命令执行完后，用 ls -l 查看一下文件的 timestamp, 是不是所有文件都修改了?

注意： xargs touch 想到于 touch (ls的结果）, 也就是说 ls的output 现在变成了 touch的input。

问题：为什么 grep, sort, tr, cut等可以直接 用 | 连接在某个命令后，比如  ls | sort, 而不能用 ls |touch , 必须用 ls | xargs touch ?
可以通过Google／stackexchange等来搜索这个问题的解答。

9. sed

Stream editor for filtering and transorming text

把 /etc/passwd中的内容显示出来，但删除2-5行
> nl /etc/passwd | sed '2,5d'

nl: 具体用法请 man nl

sed 命令格式：  [n1], [n2] 操作符， 比如 2,5d 就是删除第2到第5行
a: 新增
d: 删除
s: 替换  和vim中的s用法一样

> last | sed s/Sun/Sunday/g 

这句话作用是什么？ 运行看一下.

sed的替换语法和 vim 的完全一样： s/原始字符串/替换的字符串/g ， g表示全部替换，支持正则表达式


sed非常适合用来修改文件， 比如把某个文件中的某个字符串替换成另外一个，这时候用 -i 参数

> sed -i s/a[a|b]c/ddd/g  abc.txt

把abc.txt中 aac 和 abc的字符串都替换成ddd

10. awk
Pattern scaning and processing language

关于 awk的具体用法请参照鸟哥的书的12.4.2章节。

把 /etc/passwd中 uid < 10 的用户的名字和id都列出来

> cat /etc/passwd | awk 'BEGIN {FS=":"} $3 <10 {print $1 "\t" $3}'

这个命令很复杂，实际上是一个language， 大家可以仔细研究























