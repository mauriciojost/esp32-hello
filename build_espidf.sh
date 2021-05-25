#!/usr/bin/env bash

#set -u
#set -x 
#set -e

# From http://quickhack.net/nom/blog/2019-05-14-build-rust-environment-for-esp32.html (thanks!)

cd esp-idf
source export.sh # not sure if needed
bash install.sh
source export.sh

