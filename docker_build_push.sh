#!/bin/bash
docker build -t moussigl/multi-client ./client
docker build -t moussigl/multi-nginx ./nginx
docker build -t moussigl/multi-server ./server
docker build -t moussigl/multi-worker ./worker 
echo "$DOCKER_PASSWORD" | docker login --user "$DOCKER_USERNAME" --password-stdin 
docker push moussigl/multi-client
docker push moussigl/multi-nginx 
docker push moussigl/multi-server
docker push moussigl/multi-worker