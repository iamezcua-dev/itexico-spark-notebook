#!/bin/bash

LOG_FOLDER="logs"
LIVY_CONTAINER_NAME="itexico-livy-server"
JUPYTER_CONTAINER_NAME="itexico-jupyter-notebook"

docker build --tag $LIVY_CONTAINER_NAME:latest -f Dockerfile.livy .
docker build --tag $JUPYTER_CONTAINER_NAME:latest -f Dockerfile.jupyter .
