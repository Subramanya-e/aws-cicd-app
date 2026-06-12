#!/bin/bash

# 1. Stop and remove any existing running container (if there is one)
container_id=$(docker ps -q)
if [ ! -z "$container_id" ]; then
    echo "Stopping existing container: $container_id"
    docker stop $container_id
    docker rm $container_id
fi

# 2. Authenticate Docker with your Amazon ECR Registry
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin  551363098218.dkr.ecr.us-east-1.amazonaws.com/my-cicd-app


# 3. Pull the latest image from ECR
docker pull 551363098218.dkr.ecr.us-east-1.amazonaws.com/my-cicd-app:latest


# 4. Run the fresh container on port 80
docker run -d -p 80:80  551363098218.dkr.ecr.us-east-1.amazonaws.com/my-cicd-app:latest



