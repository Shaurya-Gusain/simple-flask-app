#!/bin/bash

echo "Stopping existing container..."

docker stop flask-app || true
docker rm flask-app || true