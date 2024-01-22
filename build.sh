#!/bin/bash

set -e
cd /mongodb
source /opt/rh/devtoolset-8/enable

python3 --version
#upgrade pip
pip3 install --upgrade pip
python3 -m pip install https://github.com/mongodb/mongo-python-driver/archive/refs/tags/4.3.3.tar.gz
pip3 install dataclasses
pip3 install cryptography
pip3 install setuptools_rust
pip3 install scikit-build
pip3 install -r etc/pip/compile-requirements.txt

./buildscripts/scons.py \
  install-core \
  --ssl=off \
  --enable-free-mon=off \
  -j 16  \
  LINKFLAGS='-static-libstdc++' \
  CC=/opt/rh/devtoolset-8/root/usr/bin/gcc \
  CXX=/opt/rh/devtoolset-8/root/usr/bin/g++

cd build/install/bin
strip mongos mongod
