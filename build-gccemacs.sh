cd ../gccemacs
git clean -fdx
git pull origin feature/native-comp
export PATH="/home/thanh/gcc/bin:${PATH}"
export LD_LIBRARY_PATH=/home/thanh/gcc/lib
export LIBRARY_PATH=/home/thanh/gcc/lib
echo $PATH
./autogen.sh
./configure --with-nativecomp --prefix=/home/thanh/emacs27 --bindir=/home/thanh/bin/
make -j4
make install
