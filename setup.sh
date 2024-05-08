#!/bin/bash

IMAGE_NAME="ubuntu-docker"
REPO_URL="https://github.com/RealConrad/ubuntu-valgrind-docker.git"
REPO_DIR="$HOME/ubuntu-valgrind-docker"

# Check if the Docker image already exists
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
	echo "Docker image not found. Setting up environment..."

	# Clone repo
	if [ -d "$REPO_DIR" ]; then
		echo "Repository already exists at $REPO_DIR. Pulling latest changes..."
		git -C "$REPO_DIR" pull
	else
		echo "Cloning repository..."
		git clone $REPO_URL $REPO_DIR
	fi

	echo "Building Docker image..."
	(cd $REPO_DIR && docker build -t $IMAGE_NAME .)
else
	echo "Docker image $IMAGE_NAME already exists."
fi

# Determine shell and profile to use
if [[ "$SHELL" == */zsh ]]; then
	PROFILE="$HOME/.zshrc"
elif [[ "$SHELL" == */bash ]]; then
	PROFILE="$HOME/.bashrc"
	if [ ! -f "$PROFILE" ]; then
		PROFILE="$HOME/.bash_profile"
	fi
else
	echo "Unsupported shell. Please use bash or zsh."
	exit 1
fi

# Add an alias
if ! grep -q 'alias ubuntu-docker=' "$PROFILE"; then
	echo -e "\nalias ubuntu-docker=\"$HOME/ubuntu-valgrind-docker/run-ubuntu-docker.sh\"\n" >> $PROFILE
	echo "Created alias 'ubuntu-docker'."
	echo "source $PROFILE"
else
	echo "Alias 'ubuntu-docker' already set up in $PROFILE."
fi

echo "Installation complete. Run 'ubuntu-docker' in your terminal."
echo "NOTE: You might have to restart your terminal or source your profile."
