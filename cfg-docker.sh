docker build -t tvm .
docker kill tvm_box
docker rm tvm_box
docker run -idt -v ~/Code/tvm:/root/tvm --name tvm_box tvm
docker exec -it tvm_box /bin/zsh

