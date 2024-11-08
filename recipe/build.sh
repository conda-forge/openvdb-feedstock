#!/bin/bash

set -ex

mkdir -p build
cd build

cmake ${CMAKE_ARGS} -LAH                    \
      -G "Unix Makefiles"                   \
      -Dnanobind_DIR=$SP_DIR/nanobind/cmake \
      -DOPENVDB_BUILD_BINARIES=ON           \
      -DOPENVDB_BUILD_PYTHON_MODULE=ON      \
      -DOPENVDB_BUILD_VDB_VIEW=ON           \
      -DOPENVDB_CORE_SHARED=ON              \
      -DOPENVDB_CORE_STATIC=OFF             \
      -DUSE_EXPLICIT_INSTANTIATION=OFF      \
      -DUSE_NUMPY=ON                        \
      ..

cmake --build .                             \
      --verbose                             \
      --parallel "${CPU_COUNT}"             \
      --target install
