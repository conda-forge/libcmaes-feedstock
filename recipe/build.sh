#!/bin/sh

cmake ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBCMAES_BUILD_PYTHON=ON \
    -DUSE_COMPILE_FEATURES=OFF \
    -DPYTHON_SITE_PACKAGES=${SP_DIR} \
    $SRC_DIR

make install -j${CPU_COUNT}
ctest --output-on-failure -j${CPU_COUNT}
