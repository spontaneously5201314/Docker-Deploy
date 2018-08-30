#!/usr/bin/env bash
docker run -d -p 80:80 --name nginx -v /data/docker/nginx/conf:/etc/nginx/:ro -v /data/docker/nginx/html:/usr/share/nginx/html:ro -d nginx