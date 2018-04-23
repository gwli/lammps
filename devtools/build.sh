TOP=`pwd`/..

SRC=$TOP/src

cd $TOP/lib/gpu
make -j -f Makefile.linux clean
make -j -f Makefile.linux 

cd $SRC
make clean-all
make no-all
make yes-manybody yes-molecule yes-replica yes-asphere yes-rigid
make yes-gpu 
make mpi -j 16
