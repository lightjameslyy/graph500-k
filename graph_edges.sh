#!/bin/bash

p=4
s=5
e=2
t=1

logfile=log-p${p}s${s}e${e}
edgesfile=edges-p${p}s${s}e${e}

#mpirun -n 4 ./graph-to-dot.exe 5 2
mpirun -n $p -genv OMP_NUM_THREADS $t ./mpi/runnable $s $e > $logfile 2>&1

cat $logfile | grep "LT_PRINT_EDGES:" | awk -F ':' '{print $3}' | sort -n > $edgesfile

