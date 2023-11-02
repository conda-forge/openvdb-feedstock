#!/bin/bash

set -ex

mkdir -p build
cd build

# https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
if [[ "$(uname)" == "Darwin" ]] ; then
      CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

cmake ${CMAKE_ARGS} -LAH                \
      -G "Unix Makefiles"               \
      -DOPENVDB_BUILD_PYTHON_MODULE=ON  \
      -DOPENVDB_CORE_SHARED=ON          \
      -DOPENVDB_CORE_STATIC=OFF         \
      -DUSE_EXPLICIT_INSTANTIATION=OFF  \
      -DUSE_NUMPY=ON                    \
      ..

cmake --build .                         \
      --verbose                         \
      --parallel "${CPU_COUNT}"         \
      --target install
