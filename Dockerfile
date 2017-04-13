FROM centos:centos7.3.1611

MAINTAINER Carlos Bittarello <cbittarello@gmail.com>

RUN yum update -y && yum -y install xmlstarlet saxon augeas bsdtar unzip && yum clean all

RUN groupadd -r wildfly -g 1000 && useradd -u 1000 -r -g wildfly -m -d /opt/wildfly -s /sbin/nologin -c "wildfly user" wildfly

RUN chmod 755 /opt/wildfly

WORKDIR /opt/wildfly

USER wildfly
