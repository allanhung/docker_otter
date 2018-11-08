FROM centos:7

RUN yum install -y wget which mysql file

# jdk
RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
RUN tar -zxf jdk-8u191-linux-x64.tar.gz -C /opt && rm -f jdk-8u191-linux-x64.tar.gz && ln -s /opt/jdk1.8.0_191 /opt/jdk
RUN update-alternatives --install  /usr/bin/java java /opt/jdk/bin/java 1065 && \
    update-alternatives --set  java /opt/jdk/bin/java && \
    update-alternatives --install  /usr/bin/javac javac /opt/jdk/bin/javac 1065 && \
    update-alternatives --set  javac /opt/jdk/bin/javac && \
    update-alternatives --install  /usr/bin/jar jar /opt/jdk/bin/jar 1065 && \
    update-alternatives --set  jar /opt/jdk/bin/jar && \
    update-alternatives --install  /usr/bin/javah javah /opt/jdk/bin/javah 1065 && \
    update-alternatives --set  javah /opt/jdk/bin/javah && \
    update-alternatives --install  /usr/bin/javap javap /opt/jdk/bin/javap 1065 && \
    update-alternatives --set  javap /opt/jdk/bin/javap

# maven
#RUN wget -q --no-check-certificate -c http://apache.osuosl.org/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
#RUN tar -zxf apache-maven-3.5.3-bin.tar.gz && rm -f apache-maven-3.5.3-bin.tar.gz && mv apache-maven-3.5.3 /opt/
#RUN update-alternatives --install  /usr/bin/mvn mvn /opt/apache-maven-3.5.3/bin/mvn 1065 && \
#    update-alternatives --set  mvn /opt/apache-maven-3.5.3/bin/mvn

# otter
RUN wget -q --no-check-certificate -c https://github.com/alibaba/otter/releases/download/otter-4.2.16/manager.deployer-4.2.16.tar.gz
RUN mkdir -p /opt/otter/otter_manager-4.2.16 && tar -zxf manager.deployer-4.2.16.tar.gz -C /opt/otter/otter_manager-4.2.16 && ln -s /opt/otter/otter_manager-4.2.16 /opt/otter/otter_manager
RUN wget -O /tmp/otter-manager-schema.sql -q --no-check-certificate -c https://raw.githubusercontent.com/alibaba/otter/master/manager/deployer/src/main/resources/sql/otter-manager-schema.sql
ADD logback.xml /opt/otter/otter_manager/conf/
ADD docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

EXPOSE 1099 8082
VOLUME ["/opt/otter/otter_manager/logs"]
ENTRYPOINT ["/docker-entrypoint.sh"]
