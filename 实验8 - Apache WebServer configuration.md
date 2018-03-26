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

安装Mysql数据库。 CentOS7以后已经把MySql数据库切换到MariaDB了， 所有不同版本的Linux，用的命令有所不同
> yum install mariadb 或者  yum install mysql-server    

安装PHP，以及和MySql的接口
> yum install php php-mysql

3. 启动 Apache服务

对于CentOS 6.0 及以前的版本：
> /etc/init.d/httpd start    启动Apache服务

> chkconfig httpd on        设置每次开机时Apache服务会自行启动

如果用的是CentOS7以后的版本：
> systemctl start httpd    启动Apache服务

> systemctl enable httpd   开机自启动

> systemctl status httpd   查看Apache目前状态

4. 为网站创建目录结构

假设你准备在这台服务器上建立两个网站，名字分别是aaa.com和bbb.com

> mkdir -p /var/www/aaa.com/public_html

> mkdir -p /var/www/bbb.com/public_html

4. 配置 Apache

5. 配置虚拟主机
