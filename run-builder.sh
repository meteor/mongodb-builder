#!/bin/bash
set -e

MONGODB_VERSION='4.2.1'
SRC="mongodb-src-r$MONGODB_VERSION"
TARGET="mongodb-linux-x86_64-${MONGODB_VERSION}"
BIN="$TARGET/bin"

[ ! -d $SRC ] && curl "https://fastdl.mongodb.org/src/$SRC.tar.gz" | tar -xz
docker run --rm -it -v $(pwd)/$SRC:/mongodb mongodb-builder
mkdir -p $BIN
mv "$SRC/mongo" "$SRC/mongod" $BIN
tar -czf "$TARGET.tgz" $TARGET
