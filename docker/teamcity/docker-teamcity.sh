#!/usr/bin/env bash
docker run -it --name teamcity-server-instance  \
    -v D:\DockerVolumes\TeamCity\datadir:/data/teamcity_server/datadir \
    -v D:\DockerVolumes\TeamCity\logs:/opt/teamcity/logs  \
    -p 8081:8111 \
    jetbrains/teamcity-serverdocker run -it --name teamcity-server-instance  \
    -v D:\DockerVolumes\TeamCity\datadir:/data/teamcity_server/datadir \
    -v D:\DockerVolumes\TeamCity\logs:/opt/teamcity/logs  \
    -p 8081:8111 \
    jetbrains/teamcity-server