# java-demo

## 数据库数据导入

```python
mysql -uroot -p'123456'  < db/tables_ly_tomcat.sql
```

## 授权mysql

```python
mysql> GRANT all on java_demo.* to 'java_demo'@'%' IDENTIFIED BY '12345678';
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)
```

## 修改连接数据库配置

修改连接数据库文件：src/main/resources/application.yml

```java
server:
  port: 8080
spring:
  datasource:
    url: jdbc:mysql://192.168.200.127:3306/java_demo?characterEncoding=utf-8 /* 修改连接数据库IP和端口、连接数据库名称*/
    username: java_demo        /*修改连接数据名*/
    password: 12345678      /*修改连接数据库的密码*/
    driver-class-name: com.mysql.jdbc.Driver
  freemarker:
    allow-request-override: false
    cache: true
    check-template-location: true
    charset: UTF-8
    content-type: text/html; charset=utf-8
    expose-request-attributes: false
    expose-session-attributes: false
    expose-spring-macro-helpers: false
    suffix: .ftl
    template-loader-path:
      - classpath:/templates/

```

## mvn编译

```
mvn clean package -Dmaven.test.skip=true 
```

## docker打包上传私有镜像仓库

```shell
export Docker_images_java=`sudo docker images |grep java >/dev/null && echo yes || echo no`
export Docker_imageID=`sudo docker images |grep '192.168.200.137/k8s/java' |awk  '{print $3}'`
if [ $Docker_images_java = yes ]
	then
    	sudo docker rmi  -f ${Docker_imageID}
else
	echo 'no'
fi
sudo docker build -t 192.168.200.137/k8s/java .
sudo docker login -u admin -p'123456' 192.168.200.137
sudo docker push 192.168.200.137/k8s/java
```

- 注释：
  - 这里用的是私有仓库地址，各位可以根据情况修改自己的镜像仓库地址