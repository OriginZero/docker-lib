#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}


artifactId=oracle
version=12.2-ee

# docker
docker build -t ${artifactId}:${version} -f ./Dockerfile.ee.12.2 .
#docker tag  ${artifactId}:${version}  ${artifactId}:latest

# hub.docker.com/szopen
group=szopen
#docker login -u szopen -p
docker tag ${artifactId}:${version} ${group}/${artifactId}:${version}
docker push ${group}/${artifactId}:${version}
