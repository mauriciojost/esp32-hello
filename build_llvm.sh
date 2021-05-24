#!/usr/bin/env bash

# From http://quickhack.net/nom/blog/2019-05-14-build-rust-environment-for-esp32.html (thanks!)

sudo apt-get install ninja-build

export MY_BUILD_ROOT="$HOME/.xtensa"
mkdir -p "$MY_BUILD_ROOT"
cd "$MY_BUILD_ROOT"

git clone https://github.com/espressif/llvm-xtensa.git
git clone https://github.com/espressif/clang-xtensa.git llvm-xtensa/tools/clang

mkdir llvm_build
cd llvm_build

# from https://gist.github.com/MabezDev/26e175790f84f2f2b0f9bca4e63275d1
cmake ../llvm-xtensa -DLLVM_TARGETS_TO_BUILD="Xtensa;X86" -DCMAKE_BUILD_TYPE=Release -G "Ninja"

# Take a while
cmake --build .
