cd ../emacs28
rm -r ~/emacs28
git clean -fdx
git pull origin master
export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
./autogen.sh
./configure --with-native-compilation --with-x-toolkit=lucid --with-xft --without-gconf --without-gsettings --with-modules --with-rsvg --prefix=/home/thanh/emacs28
 
make -j4 
make install
