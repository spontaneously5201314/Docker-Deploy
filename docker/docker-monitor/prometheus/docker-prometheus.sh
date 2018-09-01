#!/usr/bin/env bash
docker pull prom/prometheus:v1.4.1
docker run \
-d \
-p 9090:9090 \
--log-driver none \
-v /etc/prometheus:/etc/prometheus \
-v /data/prometheus:/prometheus \
-v /etc/localtime:/etc/localtime \
--name prometheus \
prom/prometheus:v1.4.1