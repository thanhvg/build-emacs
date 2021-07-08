sudo apt install liblockfile-bin liblockfile1 libm17n-0 libotf0 m17n-db xaw3dg liblockfile-dev  libm17n-dev libotf-dev xaw3dg-dev 
rm -r ~/emacs27-lucid
cd ../emacs27-lucid
git clean -fdx
git pull origin emacs-27
./autogen.sh
./configure --prefix=$HOME/emacs27lucid --with-x-toolkit=lucid --with-xft --without-gconf --without-gsettings --with-modules
make -j4
make install
