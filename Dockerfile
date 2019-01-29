
FROM centos:centos7
MAINTAINER 1396981439@qq.com
 
RUN yum install -y wget
 
RUN wget -P /usr/local  https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" -P /usr/local "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
 
WORKDIR  /usr/local
RUN mv jdk-8u201-linux-x64.tar.gz jdk-8u201-linux-x64.tar
RUN mv apache-tomcat-8.5.37.tar.gz apache-tomcat-8.5.37.tar
RUN tar -zxvf apache-tomcat-8.5.37.tar
RUN tar -zxvf jdk-8u201-linux-x64.tar
COPY server.xml /usr/local/apache-tomcat-8.5.37/conf/server.xml
 
#设置环境变量
ENV JAVA_HOME /usr/local/jdk1.8.0_201
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-8.5.37
ENV PATH $PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
 
EXPOSE 8080
ENTRYPOINT ["/usr/local/apache-tomcat-8.5.37/bin/catalina.sh", "run"]
#ENTRYPOINT /usr/local/apache-tomcat-8.5.37/bin/startup.sh && tail -f /usr/local/apache-tomcat-8.5.37/logs/catalina.out
