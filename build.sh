#!/bin/bash

set -e
cd /mongodb
pip3 install -r etc/pip/compile-requirements.txt

python3 buildscripts/scons.py \
  install-core \
  --ssl=off \
  --enable-free-mon=off -j 12 \
  --disable-warnings-as-errors \
  CCFLAGS='-Wno-write-strings' \
  LINKFLAGS='-static-libstdc++ -static'


cd build/install/bin
strip mongo mongod
