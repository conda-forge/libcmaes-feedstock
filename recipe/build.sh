#!/bin/sh

if [ "$(uname)" != "Darwin" ]; then 
    export NO_LINK_PYTHON="-DLINK_PYTHON=OFF";
    export CMAKE_EXE_LINKER_FLAGS="-undefined dynamic_lookup"
fi

cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_COMPILE_FEATURES=OFF \
    -DPYTHON_SITE_PACKAGES=${SP_DIR} \
    ${NO_LINK_PYTHON} \
    -DCMAKE_EXE_LINKER_FLAGS=${CMAKE_EXE_LINKER_FLAGS} \
    $SRC_DIR

make
make install
