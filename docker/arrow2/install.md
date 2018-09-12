# 记录arrow2项目安装软件的笔记

### 更新软件
> yum update

### 安装vim
> yum install -y vim
### 在vim中显示中文不出现乱码
> (~/.vimrc为vim配置文件)    
> vim ~/.vimrc，~表示root目录，.表示隐藏文件    
ls -a /root/     会显示.vimrc文件    
cat .vimrc       直接查看.vimrc中的内容
### 输入：
> set fileencodings=utf-8,gb2312,gbk,gb18030    
set termencoding=utf-8  
set fileformats=unix    
set encoding=prc    

### 安装rz/sz
> yum install -y lrzsz

### 安装jdk8
> wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm"     
rpm -ivh jdk-8u181-linux-x64.rpm

###　安装docker．地址：https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce-1
> sudo yum install -y yum-utils device-mapper-persistent-data lvm2  
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo  
sudo yum install docker-ce  
sudo systemctl start docker     
sudo docker run hello-world

### 更换docker国内源，中科大源官网地址：https://lug.ustc.edu.cn/wiki/mirrors/help/docker
> vim /etc/docker/daemon.json
### 添加以下内容，为中科大的源
> {     
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]    
}
### 重启
> sudo systemctl restart docker
### 验证结果
> docker info | grep mirrors

### 安装docker-compose
### 下载
> sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
### 安装
> sudo chmod +x /usr/local/bin/docker-compose
### 验证
> docker-compose --version
