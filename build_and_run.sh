#!/bin/bash

# Set the image and container names
IMAGE_NAME="nusquids-env"
CONTAINER_NAME="my_nusquids_env"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first!"
    exit 1
fi

echo "Docker is installed. Proceeding..."

# Check if Docker is running
if ! systemctl is-active --quiet docker; then
    echo "Starting Docker service..."
    sudo systemctl start docker
fi

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME ..."
docker build -t $IMAGE_NAME .

# Check if a container with the same name already exists
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "A container named $CONTAINER_NAME already exists. Removing the old container..."
    docker rm -f $CONTAINER_NAME
fi

# Run the Docker container
echo "Running Docker container: $CONTAINER_NAME ..."
docker run -it --name $CONTAINER_NAME $IMAGE_NAME

