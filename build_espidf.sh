#!/usr/bin/env bash

#set -u
#set -x 
#set -e

# From http://quickhack.net/nom/blog/2019-05-14-build-rust-environment-for-esp32.html (thanks!)
sudo apt-get install git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0


cd esp-idf
source export.sh # not sure if needed
bash install.sh
source export.sh

