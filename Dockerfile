FROM ubuntu:18.04

RUN sed --in-place 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' \
        /etc/apt/sources.list

RUN sed --in-place 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' \
        /etc/apt/sources.list

# Install dependencies
RUN apt-get update
RUN apt-get install -y \
    git \
    g++ \
    make \
    libgtest-dev \
    tree \
    sudo

RUN apt-get install -y vim
RUN git clone --recursive https://github.com/landcold7/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/script/boot -b
RUN ln -sf /usr/bin/lua5.3 /usr/bin/lua
WORKDIR /root

# docker build -t tvm .
# docker run -idt --name tvm_test tvm
# docker exec -it tvm_test /bin/zsh
# docker rm tvm_test                                                                                          ‚úò 1
# docker run -idt -p 3333:3333 --privileged \
#            -v ~/Code/algos:/root/algos --security-opt seccomp:unconfined \
#            algos-box



