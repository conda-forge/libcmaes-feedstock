@echo on

mkdir build_ && cd build_

:: see https://github.com/boostorg/system/issues/32#issuecomment-462912013
set "CFLAGS=%CFLAGS% /DHAVE_SNPRINTF=1"
set "CXXFLAGS=%CXXFLAGS% /DHAVE_SNPRINTF=1"

cmake -LAH -G "%CMAKE_GENERATOR%"                  ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"           ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"        ^
  -DUSE_COMPILE_FEATURES=OFF                       ^
  -DPYTHON_SITE_PACKAGES="%SP_DIR%" ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

ctest -C Release --output-on-failure 
if errorlevel 1 exit 1

