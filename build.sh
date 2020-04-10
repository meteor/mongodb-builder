#!/bin/bash

set -e
cd /mongodb
source /opt/rh/devtoolset-8/enable
pip3 install -r etc/pip/compile-requirements.txt

./buildscripts/scons.py \
  mongod mongo \
  --ssl=off \
  --enable-free-mon=off \
  LINKFLAGS='-static-libstdc++' \
  CC=/opt/rh/devtoolset-8/root/usr/bin/gcc \
  CXX=/opt/rh/devtoolset-8/root/usr/bin/g++

strip mongo mongod
