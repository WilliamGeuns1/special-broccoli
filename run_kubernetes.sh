#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=williamgeuns/udacity-ml-project:latest

# Step 2
# Run the Docker Hub container with kubernetes
docker login
kubectl create deployment mlproject --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods -n default
kubectl get deployments

# Step 4:
# Forward the container port to a host
kubectl expose deployment mlproject --type=LoadBalancer --port=80
