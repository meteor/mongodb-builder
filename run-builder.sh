#!/bin/bash
set -e

MONGODB_VERSION='4.2.8'
SRC="mongodb-src-r$MONGODB_VERSION"
TARGET="mongodb-linux-x86_64-${MONGODB_VERSION}"
BIN="$TARGET/bin"

[ ! -d $SRC ] && curl "https://fastdl.mongodb.org/src/$SRC.tar.gz" | tar -xz

cd "$SRC"
pip3 install scons
pip3 install -r etc/pip/compile-requirements.txt

./buildscripts/scons.py \
  mongod mongo \
  --ssl=off \
  --enable-free-mon=off \
  LINKFLAGS='-static-libstdc++' \
  CC=gcc-8 \
  CXX=g++-8

strip mongo mongod

mkdir -p ../$BIN
mv "mongo" "mongod" ../$BIN
cd ../
tar -czf "$TARGET.tgz" $BIN

