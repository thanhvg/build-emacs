rm -r ~/emacs27-lucid
cd ../emacs27-lucid
git clean -fdx
git pull origin emacs-27
./autogen.sh
./configure --with-x-toolkit=lucid --with-modules --with-json --with-rsvg --prefix=/home/thanh/emacs27-lucid
make -j4
make install
