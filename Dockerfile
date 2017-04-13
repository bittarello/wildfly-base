FROM centos:centos7.3.1611

MAINTAINER Carlos Bittarello <cbittarello@gmail.com>

RUN yum update -y && yum -y install xmlstarlet saxon augeas bsdtar unzip && yum clean all

RUN groupadd -r wildfly -g 1000 && useradd -u 1000 -r -g wildfly -m -d /opt/wildfly -s /sbin/nologin -c "wildfly user" wildfly

RUN chmod 755 /opt/wildfly

# Set the locale 
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

#alterado Localtime para Sao Paulo
RUN cp /etc/localtime /root/old.timezone && \
    rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

WORKDIR /opt/wildfly

USER wildfly
