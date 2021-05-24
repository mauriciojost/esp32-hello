#!/bin/bash

set -e
set -x
set -u

echo "### Download toolchain for ESP if not yet downloaded..."
#gcc_xtensa_version=xtensa-esp32-elf-1.22.0-80-g6c4433a-5.2.0
gcc_xtensa_version=xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0
gcc_xtensa_dir=/tmp/gcc-$gcc_xtensa_version
gcc_xtensa_subdir=xtensa-esp32-elf

if [ ! -e $gcc_xtensa_dir/$gcc_xtensa_subdir/bin ]
then
    echo "### Downloading..."
    mkdir -p $gcc_xtensa_dir
    (cd $gcc_xtensa_dir && wget https://dl.espressif.com/dl/$gcc_xtensa_version.tar.gz && tar -xvf *.tar.gz -C .)
else
    echo "### Skipping, already downloaded"
fi

export PATH=$gcc_xtensa_dir/$gcc_xtensa_subdir/bin:$PATH
export IDF_PATH=$(pwd)/esp-idf
export TARGET_DIR=target/xtensa-none-elf/release
