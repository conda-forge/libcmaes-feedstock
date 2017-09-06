
# cmake support in git
git clone https://github.com/beniz/libcmaes.git
cd libcmaes 
git checkout 1a06949

# https://github.com/beniz/libcmaes/pull/169
git remote add jschueller https://github.com/jschueller/libcmaes.git
git fetch jschueller
git cherry-pick 5f0e7f7

mkdir build && cd build

set CMAKE_CONFIG="Release"

cmake -LAH -G"NMake Makefiles"                     ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"           ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"        ^
  -DUSE_COMPILE_FEATURES=OFF                       ^
  -DPYTHON_SITE_PACKAGES="%SP_DIR%" ..
if errorlevel 1 exit 1

cmake --build . --config %CMAKE_CONFIG% --target install
if errorlevel 1 exit 1

ctest --output-on-failure --timeout 100
if errorlevel 1 exit 1
