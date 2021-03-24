#!/bin/bash
set -e

MONGODB_VERSION='4.4.4'
SRC="mongodb-src-r$MONGODB_VERSION"
TARGET="mongodb-linux-x86_64-${MONGODB_VERSION}"
BIN="$TARGET/bin"

[ ! -d $SRC ] && curl "https://fastdl.mongodb.org/src/$SRC.tar.gz" | tar -xz
cd $SRC/ && patch -p1 -f -s < ../0001-Fix-SSL-off-build-OCSPManager-shouldn-t-be-used-when.patch
cd ../
docker run --memory=16g --rm -it -v $(pwd)/$SRC:/mongodb mongodb-builder
mkdir -p $BIN
sudo mv "$SRC/build/install/bin/mongo" "$SRC/build/install/bin/mongod" $BIN
sudo tar -czf "$TARGET.tgz" $TARGET
