# 实验5 安装软件
## 实验目的
1. 掌握编译源文件的软件安装方式
2. 掌握直接用rpm包安装软件
3. 掌握用 yum来安装软件的方法
## 实验内容
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


