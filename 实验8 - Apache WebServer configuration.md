# 实验8 配置Apache Web服务器
## 实验目的
1. 了解Apache服务器的运行机制
2. 配置Apache服务器
## 实验内容
1. 安装 Apache
> yum install httpd

安装完毕后，可以看一下安装的Apache的版本信息
> yum info httpd

2. 安装 PHP，MySql(MariaDB) 

注意：对于静态网站，这一步不是必须的, 还有：不同的版本安装包和命令会略有不同，准确的命令请到产品各自的官网查看。
CentOS7以后已经把MySql数据库切换到MariaDB了， 所有不同版本的Linux，用的命令有所不同
> yum install mariadb 或者  yum install mysql    

> yum install  
3. 启动 Apache服务
4. 配置 Apache
5. 配置虚拟主机
