FROM alpine:latest

# Update and install necessary packages
RUN apk add --no-cache \
	bash \
	valgrind \
	build-base

# Set the working directory
WORKDIR /workspace

# Set bash as the default command
CMD ["/bin/bash"]
