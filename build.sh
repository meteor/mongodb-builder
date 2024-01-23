#!/bin/bash

set -e
cd /mongodb

python3 -m pip install -r etc/pip/compile-requirements.txt
python3 -m pip install requirements_parser jsonschema memory_profiler puremagic networkx cxxfilt

export GIT_PYTHON_REFRESH=quiet

./buildscripts/scons.py \
  install-core \
  -j 20  \
  LINKFLAGS='-static-libstdc++' \
  --linker=gold

cd build/install/bin
strip mongos mongod
