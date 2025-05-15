
read -p "First time build? (y/N)" ready_choice

if [ "$ready_choice" = "y" ]; then
    git clone --depth 1 https://github.com/Ravenbrook/mps.git ~/git/mps
    cd ~/git/mps
else 
    cd ~/git/mps
    git clean -fdx
    # no pull of full history
    git fetch --depth=1 origin master
fi

MPS_ARTIFACTS=~/libs/mps
cd ~/git/mps
autoconf
./configure --prefix="$MPS_ARTIFACTS"
make CFLAGSCOMPILERSTRICT="-Wno-error"
make install

mkdir -p $MPS_ARTIFACTS/mps4emacs

cp $MPS_ARTIFACTS/include/* $MPS_ARTIFACTS/lib/* $MPS_ARTIFACTS/mps4emacs
