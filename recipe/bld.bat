
mkdir build_ && cd build_

cmake -LAH -G "%CMAKE_GENERATOR%"                  ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"           ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"        ^
  -DUSE_COMPILE_FEATURES=OFF                       ^
  -DPYTHON_SITE_PACKAGES="%SP_DIR%" ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

ctest -C Release --output-on-failure --timeout 100
if errorlevel 1 exit 1

