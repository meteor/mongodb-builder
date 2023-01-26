#!/bin/bash
set -e

MONGODB_VERSION='6.0.3'
SRC="mongodb-src-r$MONGODB_VERSION"
TARGET="mongodb-linux-x86_64-${MONGODB_VERSION}"
BIN="$TARGET/bin"

[ ! -d $SRC ] && curl "https://fastdl.mongodb.org/src/$SRC.tar.gz" | tar -xz
docker run --memory=58g --rm -it -v $(pwd)/$SRC:/mongodb mongodb-builder
mkdir -p $BIN
sudo mv "$SRC/build/install/bin/mongo" "$SRC/build/install/bin/mongod" $BIN
sudo tar -czf "$TARGET.tgz" $TARGET
