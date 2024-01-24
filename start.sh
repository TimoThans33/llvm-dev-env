#!/bin/bash

# Check if the Docker container exists
if [ $(docker ps -q -f name=my-llvm-container) ]; then
    # Stop the running Docker container
    docker stop my-llvm-container

    # Remove the Docker container
    docker rm my-llvm-container
fi

# Build the Docker image
docker build -t my-llvm-image .

# Run the Docker container
docker run --name my-llvm-container -d -p 2222:22 -v $(pwd)/assignments:/assignments my-llvm-image

# You can now connect to the Docker container via SSH on port 2222 with user compiler and password optimizations (e.g. ssh compiler@localhost -p 2222)
