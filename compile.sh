cd PyFlex/bindings
rm -rf build
mkdir build
cd build

cmake -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DPYBIND11_PYTHON_VERSION=3.6 -DCMAKE_BUILD_TYPE=Release ..
make -j
