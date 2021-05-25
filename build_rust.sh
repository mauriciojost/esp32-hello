#!/usr/bin/env bash

set -u
set -x 
set -e

# From http://quickhack.net/nom/blog/2019-05-14-build-rust-environment-for-esp32.html (thanks!)

my_build_root=$(dirname $(readlink -e $0))/rust
# rust-xtensa cannot be a submodule of this project, or its bootstrap fails
if [ ! -e ../rust-xtensa ]
then
    echo "### Not built rust, building..."
    cd ..
    git clone git@github.com:mauriciojost/rust-xtensa.git
    cd rust-xtensa
    git fetch origin esp:esp # safe branch
    git checkout esp
    git submodule update --init --recursive

    mkdir -p "$my_build_root/rust_build"
    echo "### Configuring..."
    ./configure --experimental-targets=Xtensa --llvm-root="$my_build_root/llvm_build" --prefix="$my_build_root/rust_build"

    # python 2 is required.

    echo "### Building (may take a while)..."
    python ./x.py build --stage 2
    echo "### Installing..."
    python ./x.py install
else
    echo "### Already built rust, skipping..."
fi
echo "### Done"
