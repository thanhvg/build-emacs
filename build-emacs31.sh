EMACS_VERSION="31.0.91"
URL="https://alpha.gnu.org/gnu/emacs/pretest/emacs-$EMACS_VERSION.tar.xz"
DEST_DIR="$HOME/git"

read -p "First time build? (y/N) " ready_choice

if [ "$ready_choice" = "y" ]; then
    mkdir -p "$DEST_DIR"
    curl -L "$URL" -o "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz"
    tar -xf "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz" -C "$DEST_DIR"
    rm "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz"
fi

rm -rf ~/emacs31

cd "$DEST_DIR/emacs-$EMACS_VERSION"

./autogen.sh

read -p "Use gkt instead of lucid (y/N) " ready_choice

if [ "$ready_choice" = "y" ]; then
    ./configure --prefix=$HOME/emacs31 --with-native-compilation --with-modules --with-json --with-rsvg --with-tree-sitter --with-imagemagick --with-webp --without-compress-install
else
    ./configure --prefix=$HOME/emacs31 --with-native-compilation --with-modules --with-json --with-rsvg --with-tree-sitter --with-imagemagick --with-webp --with-x-toolkit=lucid --without-compress-install
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
