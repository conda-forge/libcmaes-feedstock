
# cmake support in git
git clone https://github.com/beniz/libcmaes.git
cd libcmaes 
git checkout 9fa2081 

mkdir build && cd build

set CMAKE_CONFIG="Release"

cmake -LAH -G"NMake Makefiles"                     ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"           ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"        ^
  -DPYTHON_SITE_DIR="%SP_DIR%" ..
if errorlevel 1 exit 1

cmake --build . --config %CMAKE_CONFIG% --target install
if errorlevel 1 exit 1

ctest --output-on-failure --timeout 100
if errorlevel 1 exit 1

