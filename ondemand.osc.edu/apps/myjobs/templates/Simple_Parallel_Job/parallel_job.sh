#PBS -N my_job
#PBS -l walltime=10:00:00
#PBS -l nodes=4:ppn=28
#PBS -j oe

# Here is an example of an MPI job that uses 4 nodes with 28 cores each, running one process per core
# (112 processes total). This assumes a.out was built with the gnu compiler in order to illustrate the
# module command. The module swap is necessary on Owens when running MPI programs built with a
# compiler other than Intel.
#   https://www.osc.edu/supercomputing/batch-processing-at-osc/job-scripts

module swap intel gnu

cd $PBS_O_WORKDIR

cp /users/appl/srb/workshops/openmp/a.out .
pbsdcp a.out $TMPDIR

cd $TMPDIR

mpiexec a.out

pbsdcp -g 'results*' $PBS_O_WORKDIR
