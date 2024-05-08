#!/bin/bash

IMAGE_NAME="ubuntu-docker"

# Run Docker with the current directory mounted to /workspace
docker run -it -v "$(pwd)":/workspace $IMAGE_NAME
