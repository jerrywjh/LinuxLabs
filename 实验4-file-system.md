# 实验4 Linux文件系统
## 实验目的
1. 更好的理解 Linux 文件系统基础
2. 创建和使用链接
3. 使用 locate 和 find 命令查找文件
4. 归档和压缩文件

## 实验内容

1. 用computer账号登录系统。 在用户的主目录(/home/computer)下用vim创建一个文件abc， 并输入内容 “This is my file", 然后保存并退出。
2. 查看刚才创建的abc这个文件的信息。 

> ls -l 

> ls -li  

3. 在主目录中创建一个symbolic link,指向你新创建的abc这个文件. 并查看新创建的文件的信息。 

> ln -s abc  softlink

> ls -li

4. 在主目录中分别创建一个hard link, 指向你新创建的abc这个文件. 并查看源文件，symbolic link, hardlink文件的信息。 注意各个文件的inode number和link count，并思考为什么是这样？ 

> ln abc  hardlink

> ls -li

5. 查看软链接和硬链接两个文件的内容，看看是否一致？

> head softlink  hardlink

6. 查看硬盘的使用情况。

> df
 
> df -h

> df -H
	 
这3者输出有什么不同？为什么？ 请阅读 man df 文档来找出答案。

7. 查看主目录中各个文件和子目录的大小。

> du -sh  ~/*

-s, -h 参数是什么意思，查询 man du了解

8. 对于一个没有安装GUI环境的Linux机器， 如果访问U盘？
 
   * 创建一个目录   mkdir /media/udrive
   
   * 找到U盘对应的设备名, 在拔下和插入U盘的情况下，分别运行：

     > ls /dev/sd*

     就可以找到你的U盘对应的设备名称和分区名字。

   * 假设你的U盘的设备名为sdc, 分区为sdc1, 则可以运行下面的命令：

     > mount -t vfat /dev/sdc1  /media/udrive

这样，访问/media/udrive就是访问U盘上的数据了。

9. 文件打包和压缩, 使用tar命令把 /etc的内容打包， 放到主目录中

> tar -cvf ~/etc_backup.tar  /etc

参数 -c -v -f 什么意思？  tar --help   或者 man tar

10. 对/etc的内容分别gzip, bzip2 压缩并打包，这种打包方式很常用

> tar -czvf  ~/etc_backup.tar.gz  /etc

> tar -cjvf  ~/etc_backup.tar.bz2  /etc

11. 查看不同方式得到的打包文件的大小

> ls -l  ~/

12. 把压缩打包的文件解压缩到一个特定的目录

> tar -xzvf  ~/etc_backup.tar.gz  ~/tmp

> tar -xjvf  ~/etc_backup.tar.bz2  ~/anotherdir

> tar -xvf  ~/etc_backup.tar  ~/thirddir




