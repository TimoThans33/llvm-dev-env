# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    xz-utils \
    openssh-server \
    clang-format \
    clang-tidy \
    clang-tools \
    clang clangd \
    libc++-dev \
    libc++1 \
    libc++abi-dev \
    libc++abi1 \
    libclang-dev \
    libclang1 \
    liblldb-dev \
    libllvm-ocaml-dev \ 
    libomp-dev \
    libomp5 \
    lld \
    lldb \
    llvm-dev \
    llvm-runtime \
    llvm \
    python3-clang

# Install LLVM
RUN curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04.tar.xz \
    | tar -xJC . && \
    mv clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04 llvm && \
    mv llvm/bin/* /usr/local/bin

# Setup SSH server
RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash compiler
RUN echo 'compiler:optimizations' | chpasswd
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create /assignments directory
RUN mkdir /assignments

# Automatically navigate to /assignments on login
RUN echo "cd /assignments" >> /home/compiler/.bashrc

# Set compiler as owner of /assignments
RUN chown -R compiler:compiler /assignments

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Expose port 22 for SSH
EXPOSE 22

# Run SSH server
CMD ["/usr/sbin/sshd", "-D"]