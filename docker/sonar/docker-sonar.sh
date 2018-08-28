#!/usr/bin/env bash
# 建立私有网络
docker network create sonar
# 启动PostgreSql 容器
docker pull postgres && docker run -d --name sonar-db --network sonar -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar postgres
# 启动 Sonar 容器
docker pull sonarqube
docker run -d --name sonar --network sonar -p 9000:9000 -p 9092:9092 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://sonar-db:5432/sonar sonarqube
