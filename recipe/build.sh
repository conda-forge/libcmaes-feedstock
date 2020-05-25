#!/bin/sh

cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_COMPILE_FEATURES=OFF \
    -DPYTHON_SITE_PACKAGES=${SP_DIR} \
    $SRC_DIR

make
make install
ctest
