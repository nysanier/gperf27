mkdir -p cbuild
cd cbuild
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4
