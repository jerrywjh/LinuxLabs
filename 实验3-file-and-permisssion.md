# 实验3 文件与权限
## 实验目的
1. 了解Linux的文件，用户，权限的关键
2. 设置并修改文件权限
## 实验内容
1. 登录为用户 root。
2. 登录到系统之后,你应该就位于你的主目录中。使用```id```命令来查看你的相关信息:
> id
3. 为系统新建一个用户 abc, 并设置密码
> useradd abc
> passwd abc

4. 切换到root用户
> su -

思考: ```su -``` 和 ```su``` 有何不同？

5. 在/usr中创建一个文件夹, 名字为 test.  
> mkdir test

> ls -l 

6. 在/usr/test/目录中，用vim新建一个文件 myfile, 内容为 “This is a test file"
> vim myfile

7. 切换回abc用户
> exit

exit就是退出前面用 su -命令登录的root用户，你可以系统的提示符已经改变了

7. 用abc用户的身份来编辑 /usr/test/myfile
> vim /usr/test/myfile

编辑后能正常保存么？ 为什么？

8. 如何让abc用户可以编辑myfile 文件？

- 方法1：
> su -

> chown abc:abc /usr/test/myfile

> exit

> vim /usr/test/myfile

- 方法2:

> su -

> chmod 666 /usr/test/myfile

> exit

> vim /usr/test/myfile

