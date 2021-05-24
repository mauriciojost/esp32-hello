#!/usr/bin/env bash

set -u
set -x 
set -e

my_build_root=.

cd "$my_build_root"

git clone git@github.com:MabezDev/rust-xtensa.git
cd rust-xtensa

mkdir "$my_build_root/rust_build"
./configure --llvm-root="$my_build_root/llvm_build" --prefix="$my_build_root/rust_build"

# python 2 is required.

# seems to clone something. before help is invoked.
python ./x.py --help

# Take a while
python ./x.py build
python ./x.py install
