#!/bin/bash

set -e
set -x
set -u

source setenv.sh

echo "### Makefile make app"
# export V=1
make -j6 app

echo "### Cargo build"
cargo build --release --verbose

echo "### Esptool flash"
$IDF_PATH/components/esptool_py/esptool/esptool.py \
	--chip esp32 \
	elf2image \
	--flash_mode "dio" \
	--flash_freq "40m" \
	--flash_size "2MB" \
	-o $TARGET_DIR/esp32-hello.bin \
	$TARGET_DIR/esp32-hello
    
