rm -r ~/emacs27-lucid
cd ../emacs27-lucid
git clean -fdx
git pull origin emacs-27
./autogen.sh
./configure --prefix=$HOME/emacs27lucid --with-x-toolkit=lucid --with-modules --with-modules --with-rsvg --with-json
make -j4
make install
