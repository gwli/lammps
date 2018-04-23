TOP=`pwd`/..
exec_proc=$TOP/src/lmp_mpi
data=$TOP/bench/in.lj
NUM_PROC=4

cmd="mpirun --allow-run-as-root -np $NUM_PROC $exec_proc -var x 4 -var y 4 Y -var z 4 -sf gpu -pk gpu $NUM_PROC -in $data -var iterations 1000"

nvprof --csv $cmd
mvprof --query-events
nvprof --query-metrics
nvprof --events inst_executed $cmd
nvprof --metrics all $cmd
nvprof --metrics inst_executed $cmd
nvprof --aggregate-mode-off --source-level-analysis global_access,shared_access,branch,instruction_execution,pc_sampling  $cmd

