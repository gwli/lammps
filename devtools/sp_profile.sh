TOP=`pwd`/..
exec_proc=$TOP/src/lmp_mpi
data=$TOP/bench/in.lj
NUM_PROC=4

cmd="mpirun --allow-run-as-root -np $NUM_PROC $exec_proc -var x 4 -var y 4 Y -var z 4 -sf gpu -pk gpu $NUM_PROC -in $data -var iterations 1000"
sp="/raid/tools/NsightSystems-linux-public-2018.2.0.341-b850c5a/Target-x86_64/x86_64/nsys"

rm -fr ./*.qdstrm
$sp profile --duration=20 -o lammps.qdstrm -t cuda,cublas,cudnn,osrt $cmd
