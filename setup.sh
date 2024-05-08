#!/bin/bash

IMAGE_NAME="alpine-docker"
REPO_URL="https://github.com/RealConrad/alpine-valgrind-docker.git"
REPO_DIR="$HOME/alpine-valgrind-docker"

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
if ! grep -q 'alias alpine-docker=' "$PROFILE"; then
	echo "alias alpine-docker='docker run -it -v $HOME $IMAGE_NAME'" >> $PROFILE
	echo "Created alias 'alpine-docker'."
	echo source $PROFILE
else
	echo "Alias 'alpine-docker' already set up in $PROFILE."
fi

echo "Installation complete. Run 'alpine-docker' in your terminal."
echo "NOTE: You might have to restart your terminal or source your profile."
