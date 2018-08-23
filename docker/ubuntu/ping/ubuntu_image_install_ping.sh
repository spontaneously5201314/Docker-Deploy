#!/usr/bin/env bash
# 在ubuntu镜像下安装ping
sudo docker run ubuntu apt-get update
sudo docker run ubuntu apt-get install iputils-ping