cd ../emacs30
rm -r ~/emacs30
git clean -fdx
git pull 


./autogen.sh

read -p "Use gkt instead of lucid (y/N) " ready_choice

if [ "$ready_choice" = "y" ]; then
    ./configure  --prefix=$HOME/emacs30 --with-native-compilation --with-modules --with-json --with-rsvg -with-tree-sitter --with-imagemagick --with-webp --without-compress-install
else
    ./configure  --prefix=$HOME/emacs30 --with-native-compilation --with-modules --with-json --with-rsvg -with-tree-sitter --with-imagemagick --with-webp --with-x-toolkit=lucid --without-compress-install
fi

read -p "Ready to install (y/N)?" ready_choice
if [ "$ready_choice" = "y" ]; then
    echo "Installing\n";
else
    echo "Exiting\n";
    exit 0
fi

make -j8
make install
