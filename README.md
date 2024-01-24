# LLVM Development Environment in Docker

This project sets up a Docker-based LLVM development environment. It includes a Dockerfile that sets up Ubuntu with necessary packages and tools for LLVM development, and a bash script to build and run the Docker container.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Docker: You need to have Docker installed on your machine. You can download Docker from [here](https://www.docker.com/products/docker-desktop).

### Building and Running the Docker Container

To build the Docker image, navigate to the project directory and run the `build_and_start.sh` script:

```bash
./build_and_start.sh
```

### Accessing the Docker Container

You can access the Docker container via SSH. The SSH server is set up to allow login as the compiler user. The password for the compiler user is optimizations.

```bash
ssh compiler@localhost -p 2222
```

### Working with LLVM

Once you're inside the Docker container, you'll find the LLVM tools installed and ready to use. You can start developing and testing your LLVM projects.

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details


