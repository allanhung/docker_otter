FROM centos:7

RUN yum install -y wget which file epel-release
RUN yum install -y aria2 && yum clean all

# jdk
RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz"
RUN tar -zxf jdk-8u181-linux-x64.tar.gz -C /opt && rm -f jdk-8u181-linux-x64.tar.gz && ln -s /opt/jdk1.8.0_181 /opt/jdk
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

# otter
RUN wget -q --no-check-certificate -c https://github.com/alibaba/otter/releases/download/otter-4.2.16-preview-1/node.deployer-4.2.16-SNAPSHOT.tar.gz
RUN mkdir -p /opt/otter/otter_node-4.2.16-preview-2 && tar -zxf node.deployer-4.2.16-SNAPSHOT.tar.gz -C /opt/otter/otter_node-4.2.16-preview-2 && ln -s /opt/otter/otter_node-4.2.16-preview-2 /opt/otter/otter_node
ADD logback.xml /opt/otter/otter_node/conf/
ADD docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

EXPOSE 2088 2090 9092
VOLUME ["/opt/otter/otter_node/logs", "/opt/otter/otter_node/download", "/opt/otter/otter_node/extend", "/opt/otter/otter_node/htdocs"]
ENTRYPOINT ["/docker-entrypoint.sh"]
