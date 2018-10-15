# 制作一个带有ssh功能的jenkins镜像,并使用宿主机的.ssh文件下面的公钥和私钥
FROM jenkins/jenkins:lts
MAINTAINER Spontaneously hongfei@cmcm.com
ARG ssh_home=/root/.ssh
RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/sshd && mkdir -p ${ssh_home}
EXPOSE 22
VOLUME ${ssh_home}


