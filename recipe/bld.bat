
# cmake support in git
git clone https://github.com/beniz/libcmaes.git
cd libcmaes 
git checkout 3b87935

mkdir build && cd build

cmake -LAH -G "%CMAKE_GENERATOR%"                  ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"           ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"        ^
  -DUSE_COMPILE_FEATURES=OFF                       ^
  -DBUILD_SHARED_LIBS=OFF                          ^
  -DPYTHON_SITE_PACKAGES="%SP_DIR%" ..
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

ctest -C Release --output-on-failure --timeout 100
if errorlevel 1 exit 1

