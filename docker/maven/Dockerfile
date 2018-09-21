# 创建一个使用项目组本地私服的maven镜像，在gitlab ci中使用该镜像进行打包
FROM maven:3.5.4-jdk-8

MAINTAINER Spontaneously hongfei@cmcm.com

COPY settings.xml /usr/share/maven/ref/

CMD ["mvn"]