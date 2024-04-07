#!/bin/bash

echo '检查 golang 环境是否准备就绪'

if command -v go &>/dev/null; then
    echo "Go环境已安装"
else
    echo "未找到Go环境,下载安装最新版本 Go环境"
    wget -qO- https://github.com/
fi


workdir='/disk'
user='root'
password='123456789'



#export USER=$user
#export PASSWORD=$password

export IMAGE_REGISTRY="registry.cn-hangzhou.aliyuncs.com/openimsdk"
export OPENIM_IP="82.157.160.117"

source /etc/profile
# 执行停止命令

# 删除 历史 docker 数据
cd ${workdir}/open-im-server

echo "停止IM服务"
# 停止
make stop

echo "delete opeim data dir components"
rm -rf components

echo "docker stop $(docker ps -aq)"
docker stop $(docker ps -aq)
echo "docker rm $(docker ps -aq)"
docker rm $(docker ps -aq)
echo "make init && docker compose up -d"
make init && docker compose up -d

make build

# 检测
make check

# 启动
make start


