# nuSQuIDS Docker Environment

## Overview
This project provides a **Dockerized environment** for working with **SQuIDS** and **nuSQuIDS**, making it easy to set up and run on different servers. The container is based on **Arch Linux** and includes all necessary dependencies.

## ⚠ Warning
This project is still under development, and its functionality has not been fully tested. Use it at your own risk.

## Features
- Pre-installed **SQuIDS** and **nuSQuIDS**
- Includes **Clang, GCC, Neovim, Vim, GSL, HDF5, Boost, Python, and other essential tools**
- Fully automated setup with a single script
- Supports interactive container execution

## Prerequisites
Before using this project, make sure you have **Docker** installed on your system. You can check by running:
```sh
command -v docker
```
If Docker is not installed, please install it first:
- **Ubuntu/Debian**: `sudo apt install docker.io`
- **Arch Linux**: `sudo pacman -S docker`
- **MacOS**: Use [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Installation & Usage
### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-username/nusquids-docker.git
cd nusquids-docker
```

### 2️⃣ Build and Run the Docker Container
Run the provided script to automatically build and start the container:
```sh
./build_and_run.sh
```
This will:
1. Check if Docker is installed and running.
2. Build a **Docker image** named `nusquids-env`.
3. Remove any existing container with the same name.
4. Start a new **interactive** container named `my_nusquids_env`.

### 3️⃣ Re-enter the Running Container
If the container is already running, you can re-enter it using:
```sh
docker exec -it my_nusquids_env /bin/bash
```
If the container is stopped, restart it first:
```sh
docker start my_nusquids_env
```
Then enter the container:
```sh
docker exec -it my_nusquids_env /bin/bash
```

## Included Packages
The following software packages are pre-installed:
- **Compilers & Development Tools**: Clang, GCC, CMake, Base-devel
- **Mathematical Libraries**: GSL, HDF5, Boost
- **Python & Scientific Tools**: Python, NumPy, Matplotlib, IPython
- **Editors**: Vim, Neovim
- **Version Control**: Git
- **SQuIDS & nuSQuIDS**: Pre-installed and ready to use

## Cleaning Up
To remove the Docker container and image:
```sh
docker rm -f my_nusquids_env
docker rmi nusquids-env
```

## Contributing
Feel free to **fork** this repository, submit **pull requests**, or open **issues** for improvements and bug fixes.

## License
This project is licensed under the **MIT License**.

