read -p "First time build? (y/N)" ready_choice

if [ "$ready_choice" = "y" ]; then
    # git clone -b feature/igc --depth 1 https://git.savannah.gnu.org/git/emacs.git ~/git/emacsigc
    git clone -b feature/igc --depth 1 https://github.com/emacs-mirror/emacs ~/git/emacsigc
    cd ~/git/emacsigc
else 
    cd ~/git/emacsigc
    git clean -fdx
    # no pull of full history
    git fetch --depth=1 origin feature/igc
    # git pull 
fi

rm -r ~/emacsigc

MPS_ARTIFACTS=~/libs/mps/mps4emacs

./autogen.sh

read -p "Use gtk instead of lucid (y/N) " ready_choice

if [ "$ready_choice" = "y" ]; then
    ./configure CPPFLAGS=-I$MPS_ARTIFACTS LDFLAGS=-L$MPS_ARTIFACTS --with-mps=yes --prefix=$HOME/emacsigc --with-native-compilation --with-modules --with-json --with-rsvg -with-tree-sitter --with-imagemagick --with-webp --without-compress-install
else
    ./configure CPPFLAGS=-I$MPS_ARTIFACTS LDFLAGS=-L$MPS_ARTIFACTS --with-mps=yes --prefix=$HOME/emacsigc --with-native-compilation --with-modules --with-json --with-rsvg -with-tree-sitter --with-imagemagick --with-webp --with-x-toolkit=lucid --without-compress-install
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
