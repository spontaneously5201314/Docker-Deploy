# 创建一个kafka的Dockerfile
FROM openjdk:8-jre-alpine

# Install required packages
RUN apk add --no-cache \
    bash \
    su-exec wget

RUN wget http://mirrors.hust.edu.cn/apache/kafka/2.0.0/kafka_2.11-2.0.0.tgz \
    && tar -xvf kafka_2.11-2.0.0.tgz && cd kafka_2.11-2.0.0 && bin/zookeeper-server-start.sh config/zookeeper.properties &

ENTRYPOINT ["/bin/bash", "-c", "bin/kafka-server-start.sh config/server.properties"]

EXPOSE 2181 9092