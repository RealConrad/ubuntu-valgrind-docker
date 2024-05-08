FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
        bash \
        valgrind \
        vim \
        build-essential \
        git \
        curl \
        wget \
        tar \
        gzip \
        unzip \
        ca-certificates

# Set the working directory
WORKDIR /workspace

# Custom prompt with color in bash
RUN echo 'export PS1="\\[\\033[34m\\]ubuntu-docker#\\[\\033[m\\] "' > /root/.bashrc

ENTRYPOINT ["/bin/bash"]