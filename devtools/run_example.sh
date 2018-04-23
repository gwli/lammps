TOP=`pwd`/..
exec_proc=$TOP/src/lmp_mpi
data=$TOP/bench/in.lj
NUM_PROC=4

cd $TOP
mpirun --allow-run-as-root -np $NUM_PROC $exec_proc -var x 4 -var y 4 Y -var z 4 -sf gpu -pk gpu $NUM_PROC -in $data -var iterations 1000

