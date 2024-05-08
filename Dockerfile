FROM alpine:latest

# Update and install necessary packages
RUN apk update && apk upgrade && apk add --no-cache \
	bash \
	valgrind \
	vim \
	build-base \
	git \
	curl \
	wget \
	tar \
	gzip \
	unzip \
	ca-certificates

# Set the working directory
WORKDIR /workspace

# Create and configure custom prompt for Bash
USER root
RUN echo 'export PS1="\\[\\033[34m\\]alpine-docker#\\[\\033[m\\] "' > /root/.bashrc


ENTRYPOINT ["/bin/bash"]
