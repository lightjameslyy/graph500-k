#!/bin/bash

#mpirun -n 4 ./graph-to-dot.exe 5 2
mpirun -n 4 -genv OMP_NUM_THREADS 1 ./mpi/runnable 5 2

for g in $(ls *.dot | cut -d. -f1); do
    dot -Tpng ${g}.dot -o ${g}.png
done
