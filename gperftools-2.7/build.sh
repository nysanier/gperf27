mkdir -p cbuild
cd cbuild
# cmake .. -DCMAKE_BUILD_TYPE=Release
cmake .. -DCMAKE_BUILD_TYPE=Debug
make -j4
