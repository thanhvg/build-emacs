cd ../gccemacs
rm -r ~/gccemacs
git clean -fdx
git pull origin feature/native-comp
export PATH="/home/thanh/gcc/bin:${PATH}"
export LD_LIBRARY_PATH=/home/thanh/gcc/lib
export LIBRARY_PATH=/home/thanh/gcc/lib
echo $PATH
./autogen.sh
./configure --with-nativecomp --with-modules --prefix=/home/thanh/gccemacs
make -j4 
make install
