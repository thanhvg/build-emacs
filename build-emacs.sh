cd ../emacs --with-x-toolkit=lucid
rm -r ~/emacs --with-x-toolkit=lucid
git clean -fdx
git pull origin master
export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
./autogen.sh
./configure --with-native-compilation --with-modules --with-rsvg --prefix=$HOME/emacs --with-x-toolkit=lucid
make -j4 
make install
