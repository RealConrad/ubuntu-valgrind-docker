FROM alpine:latest

# Update and install necessary packages
RUN apk add --no-cache \
	bash \
	zsh \
	valgrind \
	vim \
	build-base

# Set the working directory
WORKDIR /workspace

ENTRYPOINT ["/bin/zsh"]
