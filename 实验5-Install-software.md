# 实验5 安装软件
## 实验目的
1. 掌握编译源文件的软件安装方式
2. 掌握直接用rpm包安装软件
3. 掌握用 yum来安装软件的方法
## 实验内容
### 问什么要用源文件编译的方式来安装软件
1. Linux下大部分软件都是开源的， 有的软件只有源码编译一种安装方式
2. 可以获取该软件的最新版本，包括正在开发还没有正式release的版本

### 编译源文件方式安装redis
Redis是目前广泛应用的key-value的数据存储服务，具体介绍请参考 https://redis.io
1. 下载redis源程序
> wget http://download.redis.io/redis-stable.tar.gz
2. 解压缩
> tar xvzf redis-stable.tar.gz
3. 编译
> cd redis-stable
> make
4. 安装 
> sudo make install 

注意：make install 需要root权限。 
执行完 make install命令后，  在 /usr/local/bin/目录中会找到redis-server 和 redis-cli这两个文件。 其中redis-server是redis的服务程序， redis-cli是redis的命令行界面。

redis这个源码安装是最简单的一种，大部分情况下都没有这么简单。很多情况下都可能无法编译通过，需要先安装各种库。

### 编译源文件的方式安装nginx
Nginx是目前最广泛使用的web服务器， 具体介绍请参考：https://nginx.org/en/
1. 下载 nginx源程序
> wget http://nginx.org/download/nginx-1.11.13.tar.gz    

注意：后面的版本号1.11.13是截止到2017-04-24的最新版本，你可以到nginx官网查找最新版本的下载链接
2. 

