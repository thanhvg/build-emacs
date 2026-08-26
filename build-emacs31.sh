EMACS_VERSION="31.1"
EMACS_DIR="emacs31"
URL="https://ftpmirror.gnu.org/emacs/emacs-$EMACS_VERSION.tar.xz"
DEST_DIR="$HOME/git"

read -p "First time build? Need to download source code?(y/N) " ready_choice

if [ "$ready_choice" = "y" ]; then
    mkdir -p "$DEST_DIR"
    curl -L "$URL" -o "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz"
    tar -xf "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz" -C "$DEST_DIR"
    rm "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz"
fi

rm -rf ~/$EMACS_DIR

cd "$DEST_DIR/emacs-$EMACS_VERSION"

./autogen.sh

read -p "Use gkt instead of lucid (y/N) " ready_choice

if [ "$ready_choice" = "y" ]; then
    ./configure --prefix=$HOME/$EMACS_DIR --with-native-compilation --with-modules --with-json --with-rsvg --with-tree-sitter --with-imagemagick --with-webp --without-compress-install
else
    ./configure --prefix=$HOME/$EMACS_DIR --with-native-compilation --with-modules --with-json --with-rsvg --with-tree-sitter --with-imagemagick --with-webp --with-x-toolkit=lucid --without-compress-install
fi

read -p "Ready to install (y/N)? " ready_choice
if [ "$ready_choice" = "y" ]; then
    echo "Installing"
else
    echo "Exiting"
    exit 0
fi

make -j8
make install
