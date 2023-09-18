@echo ON

mkdir build
cd build

cmake %SRC_DIR%                                                   ^
      -G "Visual Studio 17 2022"                                  ^
      -DOPENVDB_BUILD_PYTHON_MODULE=ON                            ^
      -DOPENVDB_CORE_SHARED=ON                                    ^
      -DOPENVDB_CORE_STATIC=OFF                                   ^
      -DPYOPENVDB_INSTALL_DIRECTORY=%PREFIX%/Lib/site-packages    ^
      -DUSE_EXPLICIT_INSTANTIATION=OFF                            ^
      -DUSE_NUMPY=ON                                              ^
      -DPython_EXECUTABLE=%PYTHON%                                ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%"              ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%"

if %ERRORLEVEL% neq 0 (type CMakeError.log && exit 1)

cmake --build . --verbose --target install --config Release

if %ERRORLEVEL% neq 0 exit 1
