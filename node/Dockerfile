FROM centos:7

RUN yum install -y wget which epel-release
RUN yum install -y aria2 && yum clean all

# jdk
RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz"
RUN tar -zxf jdk-8u171-linux-x64.tar.gz -C /opt && rm -f jdk-8u171-linux-x64.tar.gz && ln -s /opt/jdk1.8.0_171 /opt/jdk
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
RUN wget -q --no-check-certificate -c https://github.com/alibaba/otter/releases/download/v4.2.15/node.deployer-4.2.15.tar.gz
RUN mkdir -p /opt/otter/otter_node-4.2.15 && tar -zxf node.deployer-4.2.15.tar.gz -C /opt/otter/otter_node-4.2.15 && ln -s /opt/otter/otter_node-4.2.15 /opt/otter/otter_node
ADD docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh

EXPOSE 2088 2090 9092
VOLUME ["/opt/otter/otter_node/logs"]
ENTRYPOINT ["/docker-entrypoint.sh"]
