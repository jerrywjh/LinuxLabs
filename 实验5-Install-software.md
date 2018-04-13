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

2. 创建一个名字为nginx的用户 (nologin shell),  nginx服务将会使用这个用户作为owner
> useradd nginx

> usermod -s /sbin/nologin nginx

可以在 /etc/passwd中查看该用户是否正常添加了
3. 源文件解压缩
> tar xzvf nginx-1.11.13.tar.gz

> cd nginx-1.11.13 
4. 生产Makefile
> ./configure --user=nginx --group=nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log

关于各个参数的意义，可以参考 ./configure --help 命令

编译的时候，会检查相关的类库是否已经安装，一般情况下，都会出现 error，报告某个库不存在。 因为不同的OS版本，不同的使用者，安装的类库都不同，因此每个人可能的错误信息都不同。

这里以 PCRE类库缺省为例，你需要安装 pcre-devel 这个包。  （ devel的后缀说明是开发用的库，源码编译的时候，往往需要的不是pcre,而是pcre-devel )

如何安装这个包呢？ 一个方法是找到这包的源文件，下载，编译， 安装。。。  

另一个方法是直接用yum安装： yum install pcre-devel 

关于yum的使用，请参照本实验后面的部分。 

如果 yum 找不到pcre-devel库或其他相关的库，需要先为yum 增加 EPEL的repository。

> wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm 

> wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

> wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
 
 （注意：不通版本的OS链接并不一样，从官网查找合适的安装包, 上面3个包分别是 CentOS 7, CentOS 6 32bit, CentOS 6 64bit对应的package ）
 
> rpm -ivh epel-release-x-x.noarch.rpm

> yum install pcre-devel

> yum install zlib-devel

> yum install ... (其他缺失的库）
5. 编译， 安装
> make 

> make install

6. 运行
> /usr/sbin/nginx -c /etc/nginx/nginx.conf

你可以用 ps aux 命令来查看 nginx是否已经运行了

### RPM 软件安装
1. 查看目前安装的软件
> rpm -qa   

-q: query  -a:all

2. 我们前面刚刚已经用过 rpm -ivh 安装过 EPEL的 repository, 你可以回顾一下

2. 查看是否安装了apache服务器
> rpm -qi httpd

3. 安装apache服务

下载安装包
> wget http://mirror.centos.org/centos/6/os/x86_64/Packages/httpd-2.2.15-59.el6.centos.x86_64.rpm

用rpm命令安装
> rpm -ivh httpd-2.2.15-59.el6.centos.x86_64.rpm

这个安装能否成功？ 很多情况下可能会报错，因为依赖的库不存在。这种情况下，需要先安装依赖库。 
如果无法通过这种方式安装成功，可以用后面的yum方式。

查询是否安装成功
> rpm -qi httpd

### 用YUM安装软件
前面提到的 源码编译和 rpm -ivh 的安装方式，最大的问题就是软件依赖。 很多情况下，安装一个软件的时候会提示缺少这个那个库， 当你去安装依赖的库时，有时又会提示你这个库还缺少的其他依赖。 YUM comes to resure!

1. 用yum 安装 apache服务
> yum install httpd

如果检查到httpd需要其他前置依赖，yum会自动先安装这些依赖。因此用yum安装非常省心。

2. 检查 apache的安装情况
> yum info httpd

3. 升级 apache
> yum update httpd

4. 卸载 apache
> yum remove httpd


### 安装软件的一般步骤
一般来讲，在CentOS中要安装一个软件，首先尝试用yum方式来安装，一般常用的软件都可以通过这种方式安装成功。 

如果软件比较冷门，或者你要用最新版的某个开源项目，你可以尝试找到其 rpm包，然后通过RPM方式来安装。  如果rpm也没有，只能下载源码进行编译和安装。








