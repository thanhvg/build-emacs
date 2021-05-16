cd ../gccemacs
rm -r ~/gccemacs
git clean -fdx
git pull origin master
# export PATH="/home/thanh/gcc/bin:${PATH}"
# export LD_LIBRARY_PATH=/home/thanh/gcc/lib
# export LIBRARY_PATH=/home/thanh/gcc/lib
# echo $PATH
export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
./autogen.sh
./configure --with-native-compilation --with-modules --with-rsvg --prefix=/home/thanh/gccemacs
make -j4 
make install
