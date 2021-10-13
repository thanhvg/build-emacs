cd ../emacs28
rm -r ~/emacs28
git clean -fdx
git pull
export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
./autogen.sh
./configure  --prefix=$HOME/emacs28 --with-native-compilation --with-x-toolkit=lucid --with-modules --with-rsvg
 
make -j4 
make install
