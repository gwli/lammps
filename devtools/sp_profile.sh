TOP=`pwd`/..
exec_proc=$TOP/src/lmp_mpi
data=$TOP/bench/in.lj
NUM_PROC=4

cmd="mpirun --allow-run-as-root -np $NUM_PROC $exec_proc -var x 4 -var y 4 Y -var z 4 -sf gpu -pk gpu $NUM_PROC -in $data -var iterations 1000"
sp="/raid/tools/SP/NsightSystems-linux-public-2018.0.0.170-5fe72bc/Target-x86_64/x86_64/sp"

rm -fr ./*.qdstrm
$sp profile --duration=10 -o lmmps.qdstrm -t cuda,cublas,curand,cudnn,osrt $cmd
mv lmmps.qdstrm ../../devtools
