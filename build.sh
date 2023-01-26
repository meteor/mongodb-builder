#!/bin/bash

set -e
cd /mongodb
source /opt/rh/devtoolset-8/enable

pip3 install --upgrade pip
#upgrade pip
pip3 install dataclasses
pip3 install cryptography
pip3 install setuptools_rust
pip3 install scikit-build
pip3 install -r etc/pip/compile-requirements.txt

./buildscripts/scons.py \
  install-core \
  --ssl=off \
  --enable-free-mon=off \
  -j 36 \
  LINKFLAGS='-static-libstdc++' \
  CC=/opt/rh/devtoolset-8/root/usr/bin/gcc \
  CXX=/opt/rh/devtoolset-8/root/usr/bin/g++

cd build/install/bin
strip mongo mongod
