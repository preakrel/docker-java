
FROM daocloud.io/php_ity/docker-ubuntu

MAINTAINER 1396981439@qq.com
 
WORKDIR  /usr/local

RUN wget -P /usr/local  https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz && \
mv apache-tomcat-8.5.37.tar.gz apache-tomcat-8.5.37.tar && tar -zxvf apache-tomcat-8.5.37.tar && mv apache-tomcat-8.5.37 apache-tomcat && rm -rf apache-tomcat-8.5.37.tar

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" -P /usr/local "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz" && \
mv jdk-8u201-linux-x64.tar.gz jdk-8u201-linux-x64.tar && tar -zxvf jdk-8u201-linux-x64.tar && mv jdk1.8.0_201 jdk && rm -rf jdk-8u201-linux-x64.tar
 

COPY conf/server.xml /usr/local/apache-tomcat/conf/server.xml
 
#设置环境变量
ENV JAVA_HOME /usr/local/jdk
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
 
EXPOSE 8080
ENTRYPOINT ["/usr/local/apache-tomcat/bin/catalina.sh", "run"]
#ENTRYPOINT /usr/local/apache-tomcat/bin/startup.sh && tail -f /usr/local/apache-tomcat/logs/catalina.out
