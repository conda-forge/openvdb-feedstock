#!/bin/bash

set -ex

mkdir -p build
cd build
cmake ${SRC_DIR} \
      ${CMAKE_ARGS} \
      -DOPENVDB_BUILD_PYTHON_MODULE=ON \
      -DOPENVDB_CORE_SHARED=ON \
      -DOPENVDB_CORE_STATIC=OFF \
      -DUSE_EXPLICIT_INSTANTIATION=OFF \
      -DUSE_NUMPY=ON

cmake --build . --verbose --parallel
cmake --build . --verbose --target install --parallel
