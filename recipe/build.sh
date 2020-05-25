#!/bin/sh


cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_SITE_PACKAGES=${SP_DIR} \
    $SRC_DIR
make
make install
