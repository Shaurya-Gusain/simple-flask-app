#!/bin/bash

echo "Pulling latest Docker image..."

docker pull shaurya45/simple-flask-app:latest

echo "Starting new container..."

docker run -d -p 5000:5000 --name flask-app shaurya45/simple-flask-app:latest 
