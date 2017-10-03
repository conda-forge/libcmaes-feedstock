#!/bin/sh

PYTHON_INCLUDE_DIR=`python -c "from sysconfig import get_paths; info = get_paths(); print(info['include'])"`
export CXXFLAGS="${CXXFLAGS} -I${PREFIX}/include -I${PYTHON_INCLUDE_DIR}"

if test "${PY3K}" = "1"
then
  with_boost_python3="--with-boost-python=boost_python3"
fi

./autogen.sh
./configure --prefix=${PREFIX} --enable-python --enable-onlylib --with-eigen3-include=${PREFIX}/include/eigen3 ${with_boost_python3}
make -j${CPU_COUNT}
make install
mv ${PREFIX}/lib/lcmaes.so ${SP_DIR}
${PYTHON} python/ptest.py
