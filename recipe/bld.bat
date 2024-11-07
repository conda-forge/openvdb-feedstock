@echo ON

mkdir build
cd build

cmake %CMAKE_ARGS% -LAH                                           ^
      -G "Visual Studio 17 2022"                                  ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"              ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%"                 ^
      -Dnanobind_DIR="%SP_DIR%/nanobind/cmake"                    ^
      -DOPENVDB_BUILD_BINARIES=ON                                 ^
      -DOPENVDB_BUILD_PYTHON_MODULE=ON                            ^
      -DOPENVDB_BUILD_VDB_VIEW=ON                                 ^
      -DOPENVDB_CORE_SHARED=ON                                    ^
      -DOPENVDB_CORE_STATIC=OFF                                   ^
      -DVDB_PYTHON_INSTALL_DIRECTORY="%PREFIX%/Lib/site-packages" ^
      -DPython_EXECUTABLE="%PYTHON%"                              ^
      -DUSE_EXPLICIT_INSTANTIATION=OFF                            ^
      -DUSE_NUMPY=ON                                              ^
      ..

if %ERRORLEVEL% neq 0 (type CMakeError.log && exit 1)

cmake --build .                                                   ^
      --verbose                                                   ^
      --parallel "%CPU_COUNT%"                                    ^
      --target install                                            ^
      --config Release

if %ERRORLEVEL% neq 0 exit 1
