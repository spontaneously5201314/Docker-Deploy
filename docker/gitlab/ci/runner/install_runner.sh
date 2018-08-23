#!/usr/bin/env bash
docker run -d --name gitlab-runner --restart always \
  -v /opt/docker/gitlab_runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest


docker run --rm -t -i -v /opt/docker/gitlab_runner/config:/etc/gitlab-runner --name gitlab-runner gitlab/gitlab-runner register

docker run -d --name gitlab-runner --restart always \
  -v /opt/docker/gitlab_runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --network host gitlab/gitlab-runner:latest

docker run -d --name gitlab-runner --add-host gitlab.local:10.106.128.234 --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest

# 上述指令主要是根据gitlab/gitlab-runner这个docker镜像运行一个docker container，
# 这个镜像里安装好了gitlab-runner这个程序来为我们创建测试用的虚拟环境。
# 我们把这个container用--name参数命名为gitlab-runner。
# -v指令代表挂载，将host服务器主机的/var/run/docker.sock和/srv/gitlab-runner/config这两个文件或文件夹
# 与gitlab-runner这个container内部的/var/run/docker.sock和/etc/gitlab-runner这两个文件或文件夹挂载在一起。
# /var/run/docker.sock是用来创建docker container的，使用docker宿主机挂载的/var/run/docker.sock，
# 使得gitlab-runner container可以利用宿主机的docker来创建container，而不需要使用docker-in-docker。
# /etc/gitlab-runner/里面则有一个config.toml文件，我们通过这个文件来设置一些runner的参数，
# 挂载在host的/srv/gitlab-runner/config里使得我们可以通过修改host主机的这个文件来设置runner的参数。

# 还有一个比较重要的参数是–add-host。这个参数在Gitlab CI官网上是找不到的，但对于我们是必须的。
# 因为gitlab.local是一个内网的gitlab服务器，不能通过公共的DNS来查找到，这个参数会把gitlab.local加到gitlab-runner container的host文件里。
# 这个是docker提供的一个参数，当然我想如果host服务器的host文件里如果有gitlab.local的信息，通过上面说的挂载host主机上的/etc/hosts的方法也可以实现我们的需求。
# 所以，如果gitlab服务器建在内网（我觉得是大多数情况），都需要通过这种方法解决。

# 注册Runner可参考文档：https://wjqwsp.github.io/2016/11/23/Gitlab-CI-%E4%B8%8E-Docker-%E7%9A%84%E9%85%8D%E7%BD%AE%E4%B8%8E%E6%95%B4%E5%90%88%E6%B5%81%E7%A8%8B/



sudo docker run ubuntu apt-get update
sudo docker run ubuntu apt-get install iputils-ping