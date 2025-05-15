# git clone https://github.com/Ravenbrook/mps.git ~/git/mps


MPS_ARTIFACTS=~/libs/mps
cd ../mps
autoconf
./configure --prefix="$MPS_ARTIFACTS"
make CFLAGSCOMPILERSTRICT="-Wno-error"
make install

mkdir -p $MPS_ARTIFACTS/mps4emacs

cp $MPS_ARTIFACTS/include/* $MPS_ARTIFACTS/lib/* $MPS_ARTIFACTS/mps4emacs
