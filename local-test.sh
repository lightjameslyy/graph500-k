# For MPICH
#mpirun -v -n 1 -outfile-pattern l-P1T1S18 -genv OMP_NUM_THREADS 1 ./mpi/runnable 18
#mpirun -v -n 1 -outfile-pattern l-P1T2S18 -genv OMP_NUM_THREADS 2 ./mpi/runnable 18
#mpirun -v -n 1 -outfile-pattern l-P1T4S18 -genv OMP_NUM_THREADS 4 ./mpi/runnable 18
#mpirun -v -n 1 -outfile-pattern l-P1T12S18 -genv OMP_NUM_THREADS 12 ./mpi/runnable 22
#mpirun -v -n 1 -outfile-pattern l-P1T24S18 -genv OMP_NUM_THREADS 24 ./mpi/runnable 18

# P: MPI processes
# T: OpenMP threads
# S: SCALE

# let P=1
for T in 8 16 32 64
do
    for S in 24 26 28 
    do
        result_file=l-P1T${T}S${S}
        log_file=${result_file}.log
        echo $result_file $log_file
        mpirun -v -n 1 -outfile-pattern $result_file -genv OMP_NUM_THREADS $T ./mpi/runnable ${S} > $log_file 2>&1
        sleep 2
    done
done

echo ""

# let T=1
for P in 8 16 32 64
do
    for S in 24 26 28 
    do
        result_file=l-P${P}T1S${S}
        log_file=${result_file}.log
        echo $result_file $log_file
        mpirun -v -n $P -outfile-pattern $result_file -genv OMP_NUM_THREADS 1 ./mpi/runnable ${S} > $log_file 2>&1
        sleep 2
    done
done

echo ""

# let P*T=64
for P in 2 4 8 16 32 
do
    T=$((64/${P}))
    for S in 24 26 28 
    do
        result_file=l-P${P}T${T}S${S}
        log_file=${result_file}.log
        echo $result_file $log_file
        mpirun -v -n $P -outfile-pattern $result_file -genv OMP_NUM_THREADS ${T} ./mpi/runnable ${S} > $log_file 2>&1
        sleep 2
    done
done
