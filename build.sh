#!/bin/bash

set -ex

generate_docker_files() {
    mkdir -p $1
    cat Dockerfile \
        | sed s/__PY_VER__/$1/ \
        > $1/Dockerfile
    cp get-pip.py $1/
}

build_docker_images() {
    docker build --no-cache --force-rm --pull -t mrupgrade/deadsnakes:$1 $1/
}

test_image() {
    docker run -it --rm mrupgrade/deadsnakes:$1 python --version
}


wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py

for VER in 2.6 2.7 3.3 3.4 3.5
do
    if [ "$1" = 'gen' ]
    then
        generate_docker_files $VER
    else
        generate_docker_files $VER
        build_docker_images $VER
        test_image $VER
    fi
done
