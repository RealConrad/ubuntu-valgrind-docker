#!/bin/bash

IMAGE_NAME="alpine-docker"

# Run Docker with the current directory mounted to /workspace
docker run -it -v "$(pwd)":/workspace $IMAGE_NAME
