#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}


artifactId=openjdk
version=11-jdk-cn


if [ ! -d "fonts" ];then
  mkdir fonts
fi
cp ../../share/fonts/*.ttf fonts/
cp ../../share/fonts/*.ttc fonts/

# docker
docker build -t ${artifactId}:${version} -f ./Dockerfile .
#docker tag  ${artifactId}:${version}  ${artifactId}:latest

# hub.docker.com/szopen
group=szopen
#docker login -u szopen -p
docker tag ${artifactId}:${version} ${group}/${artifactId}:${version}
docker push ${group}/${artifactId}:${version}


docker tag ${artifactId}:${version} ${group}/${artifactId}:11
docker push ${group}/${artifactId}:11

## latest
docker tag ${artifactId}:${version} ${group}/${artifactId}:latest
docker push ${group}/${artifactId}:latest