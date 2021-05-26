#!/bin/bash

set -e
set -x
set -u

echo "### Download toolchain for ESP if not yet downloaded..."
#gcc_xtensa_version=xtensa-esp32-elf-1.22.0-80-g6c4433a-5.2.0
#gcc_xtensa_version=xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0
#gcc_xtensa_dir=/tmp/gcc-$gcc_xtensa_version
#gcc_xtensa_subdir=xtensa-esp32-elf
custom_rustc=$(dirname $(readlink -e $0))/../rust-xtensa

#if [ ! -e $gcc_xtensa_dir/$gcc_xtensa_subdir/bin ]
#then
#    echo "### Downloading..."
#    mkdir -p $gcc_xtensa_dir
#    (cd $gcc_xtensa_dir && wget https://dl.espressif.com/dl/$gcc_xtensa_version.tar.gz && tar -xvf *.tar.gz -C .)
#else
#    echo "### Skipping, already downloaded"
#fi

#export PATH=$gcc_xtensa_dir/$gcc_xtensa_subdir/bin:$PATH
export IDF_PATH=$(pwd)/esp-idf
export TARGET_DIR=target/xtensa-none-elf/release

export RUST_BACKTRACE=1
export XARGO_RUST_SRC=$custom_rustc/library # or /src for an older compiler
export RUSTC=$custom_rustc/build/x86_64-unknown-linux-gnu/stage2/bin/rustc
export RUSTDOC=$custom_rustc/build/x86_64-unknown-linux-gnu/stage2/bin/rustdoc
export PATH=$PATH:$custom_rustc/build/x86_64-unknown-linux-gnu/stage0/bin/ # cargo
export PATH=$PATH:$custom_rustc/build/x86_64-unknown-linux-gnu/stage2/bin/ # rust{c,doc}

source esp-idf/export.sh
