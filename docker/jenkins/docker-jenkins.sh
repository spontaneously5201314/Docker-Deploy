#!/usr/bin/env bash
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

# 地址：https://github.com/jenkinsci/docker/blob/master/README.md

# 在编写jenkins中构建任务的时候，如果是shell脚本的，可以在开始第一行加入“BUILD_ID=DONTKILLME”
# 这句话的作用是，在jenkins指定部署任务完成后，自己的部署线程结束，但是部署完的server进行不会被杀死

# 第二句可以使用“. /etc/profile”，其主要作用是用来重新加载一下/etc/profile目录下的配置