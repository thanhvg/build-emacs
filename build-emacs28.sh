cd ../emacs28
rm -r ~/emacs28
git clean -fdx
git pull

# enable this for 20.04
# export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10

read -p "Apply CC/CCX settings for 20.04 (y/n)?" gcc_choice
if [ "$gcc_choice" = "y" ]; then
    echo "applying gcc\n";
    export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
else
    echo "use system gcc\n";
fi

./autogen.sh
./configure  --prefix=$HOME/emacs28 --with-native-compilation --with-x-toolkit=lucid --with-modules --with-rsvg

read -p "Ready to install (y/n)?" ready_choice
if [ "$ready_choice" = "y" ]; then
    echo "Installing\n";
else
    echo "Exiting\n";
    exit 1
fi

make -j4
make install
