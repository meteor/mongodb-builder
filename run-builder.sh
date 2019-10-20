#!/bin/bash
set -e

MONGODB_VERSION='4.2.1'
SRC="mongodb-src-r$MONGODB_VERSION"
[ ! -d $SRC ] && curl "https://fastdl.mongodb.org/src/$SRC.tar.gz" | tar -xz
docker run --rm -it -v $(pwd)/$SRC:/mongodb mongodb-builder
