# xunjian

##安装环境
jdk 1.8
Tomcat 7.0
Mysql 5.5
Android 4.2

##导入数据xunjian.sql

**连接MYSQL**
 格式： mysql -h主机地址 -u用户名 －p用户密码
**导入数据**
```
创建数据库
create database xunjian;
选择数据库
use xunjian;
设置编码格式
set names=utf8;
导入数据
source 路径/xunjian.sql
```

#发布tomcat程序
将xunjian-web.war放到Tomcat／webapps

也可修改conf/server.xml
<Context docBase="路径/xunjian-web" path="/xunjian-web" reloadable="true" source="org.eclipse.jst.jee.server:xunjian-web"/>

#修改程序数据库连接
mysql的主机地址用户名用户密码
jdbc.properties

#androi客户端
管理员密码admin1234
