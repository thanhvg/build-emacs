# Set variables
EMACS_VERSION="30.2"
URL="https://ftp.gnu.org/gnu/emacs/emacs-$EMACS_VERSION.tar.xz"
DEST_DIR="$HOME/git"

read -p "First time build? (y/N)" ready_choice

if [ "$ready_choice" = "y" ]; then
    # Create destination directory if it doesn't exist
    mkdir -p "$DEST_DIR"

    # Download the file
    curl -L "$URL" -o "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz"

    # Extract the file
    tar -xf "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz" -C "$DEST_DIR"

    # Remove the archive file
    rm "$DEST_DIR/emacs-$EMACS_VERSION.tar.xz"
fi

rm -r ~/emacs30

cd "$DEST_DIR/emacs-$EMACS_VERSION"

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
