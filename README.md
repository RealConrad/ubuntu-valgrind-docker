# Ubuntu-based Development Docker Environment

This Docker environment is configured to support development, particularly with tools such as Valgrind for memory debugging. It will mount the current directory to the docker container.

## Features
- **Ubuntu Base:** Utilizes the latest Ubuntu base image for compatibility with a wide range of development tools.
- **Development Tools Included:**
  - **Valgrind:** Advanced debugging, memory leak detection, and profiling.
  - **Vim:** Text editor for in-container development.
  - **Build-essential:** Compilers and libraries essential for compiling C/C++ applications.
  - **Git, Curl, Wget:** Tools for source control and downloading files.
  - **Tar, Gzip, Unzip:** Utilities for handling compressed files and archives.
  - **CA-certificates:** Essential for SSL/TLS certificates used in secure communications.

## Prerequisites
- Docker Desktop
- Make sure docker is running before launching the ubuntu enviornment
 
## Installaiton
### Via Curl
> The script will create an alias. \
NOTE: you might have to restart your terminal or run: `source ~/YOUR_SHELL_PROFILE` (e.g. `source ~/.zshrc`)
```bash
curl -o- https://raw.githubusercontent.com/RealConrad/ubuntu-valgrind-docker/main/setup.sh | bash
```

Run alias in the directory you want to test
```bash
ubuntu-docker
```

### Manually

Clone the repo
```bash
git clone https://github.com/RealConrad/ubuntu-valgrind-docker.git
```

Enter directory and run script
```bash
cd ubuntu-valgrind-docker && ./setup.sh
```

After complete you can run this in your terminal
> The script will create an alias. \
NOTE: you might have to restart your terminal or run: `source ~/YOUR_SHELL_PROFILE` (e.g. `source ~/.zshrc`)
```bash
ubuntu-docker
```

## License
MIT (view the license tab)
