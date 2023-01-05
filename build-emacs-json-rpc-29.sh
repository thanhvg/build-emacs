# git clone https://github.com/emacs-lsp/emacs.git --depth=5 --branch json-rpc-29 emacsjrpc
cd ../emacsjrpc
rm -r ~/emacsjrpc
git clean -fdx
git pull 

read -p "Apply CC/CCX settings for 20.04 (y/n)?" gcc_choice
if [ "$gcc_choice" = "y" ]; then
    echo "applying gcc\n";
    # enable this for 20.04
    export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
else
    echo "use system gcc\n";
fi

./autogen.sh
./configure --with-native-compilation --with-modules --with-rsvg --prefix=$HOME/emacsjrpc --with-x-toolkit=lucid

read -p "Ready to install (y/n)?" ready_choice
if [ "$ready_choice" = "y" ]; then
    echo "Installing\n";
else
    echo "Exiting\n";
    exit 0
fi

make -j4
make install
