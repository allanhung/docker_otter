FROM centos:7

RUN yum install -y wget which

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

# zookeeper
RUN wget -q --no-check-certificate -c http://apache.mirror.digitalpacific.com.au/zookeeper/stable/zookeeper-3.4.12.tar.gz
RUN mkdir -p /opt/otter && tar -zxf zookeeper-3.4.12.tar.gz -C /opt/otter && rm -f zookeeper-3.4.12.tar.gz && ln -s /opt/otter/zookeeper-3.4.12 /opt/otter/zookeeper && \
    mkdir -p /data/zookeeper && \
      sed -ri 's|(dataDir=).*$|\1'"/data/zookeeper"'|' /opt/otter/zookeeper/conf/zoo_sample.cfg && \
    mkdir -p /var/log/zookeeper && \
      sed -ri 's|(zookeeper.root.logger=).*|\1'"INFO, CONSOLE, ROLLINGFILE"'|' /opt/otter/zookeeper/conf/log4j.properties && \
      sed -ri 's|(zookeeper.log.dir=).*|\1'"/var/log/zookeeper"'|' /opt/otter/zookeeper/conf/log4j.properties

ADD docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 2181 2888 3888
WORKDIR /opt/otter/zookeeper
VOLUME ["/data/zookeeper", "/var/log/zookeeper"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/otter/zookeeper/bin/zkServer.sh", "start-foreground"]
