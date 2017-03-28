# 实验3 文件与权限
## 实验目的
1. 了解Linux的文件，用户，权限的关键
2. 设置并修改文件权限
## 实验内容
1. 登录为用户 computer。
2. 登录到系统之后,你应该就位于你的主目录中。使用```id```命令来查看你的相关信息:
> id
3. 切换到root用户
> su -

思考: ```su -``` 和 ```su``` 有何不同？

4. 在/usr中创建一个文件夹, 名字为 test.  
> mkdir test

> ls -l 

5. 在/usr/test/目录中，用vim新建一个文件 myfile, 内容为 “This is a test file"
> vim myfile

6. 切换回computer用户
> exit

exit就是退出前面用 su -命令登录的root用户，你可以系统的提示符已经改变了

7. 用computer用户的身份来编辑 /usr/test/myfile
> vim /usr/test/myfile

编辑后能正常保存么？ 为什么？

8. 如何让computer用户可以编辑myfile 文件？

- 方法1：
> su -

> chown computer:computer /usr/test/myfile

> exit

> vim /usr/test/myfile

- 方法2:

> su -

> chmod 666 /usr/test/myfile

> exit

> vim /usr/test/myfile

