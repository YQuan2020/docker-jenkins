1. 官方镜像jenkins:latest 只支持到2.60.3, 太旧,很多插件安装不了
2. 官方推荐新镜像 jenkins/jenkins:lts，或者使用jenkinsci/blueocean（blueocean ui 版本）
3. 使用宿主机共享docker方案
   1. 宿主机docker版本: docker 1.17
   2. 最新docker 1.19 需要用到libc 2.32, jenkins镜像的系统最高只支持到2.24, 会报错
4. 预安装依赖
   1. apt-get update
   2. apt-get install build-essential libltdl7 sudo
5. 端口
   1. 8080客户端
   2. 50000 JNLP使用的端口，具体可以查jenkins文档/google
6. 与宿主机共享docker
   1.  -v /var/run/docker.sock:/var/run/docker.sock
   2.  -v $(which docker):$(which docker)
7. 挂载docker数据, 挂载后可以通过sudo docker volume ls 命令查看，保留相应的配置插件数据
   1. -v jenkins_home:/var/jenkins_home
8. 运行
````
docker run \
    --user=root --privileged \
    -d \
    -p 8080:8080 \
    -p 50000:50000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(which docker):$(which docker) \
    -v jenkins_home:/var/jenkins_home \
    --name jenkins \
    registry.cn-hangzhou.aliyuncs.com/provide-a-name/jenkins:betal
````

ps:
    1. 运行make build，使用 Makefile 打包jenkins镜像，再根据自己的情况是否上传到自己的容器镜像服务器

