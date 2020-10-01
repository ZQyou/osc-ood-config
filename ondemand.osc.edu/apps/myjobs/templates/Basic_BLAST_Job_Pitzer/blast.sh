#!/bin/bash
#SBATCH --job-name="rfm_blast_tblast_example_job"
#SBATCH --nodes=1
#SBATCH --output=rfm_blast_tblast_example_job.out
#SBATCH --error=rfm_blast_tblast_example_job.err
#SBATCH --time=0:10:0
#SBATCH -p serial
#SBATCH --exclusive
module load intel
module load blast-database/2018-08
module load blast


# Check module environment
module list
echo MODULEPATH=$MODULEPATH 1>&2

 
#
# Copy input data to the fast file system
#
cp 100.fasta $TMPDIR
cd $TMPDIR

#
# Run tblastn with 16 threads
# compares a protein query sequence against a nucleotide sequence database
# dynamically translated in all six reading frames (both strands).
#
tblastn -db nt -query 100.fasta -num_threads 16 -out 100_tblastn.out

#
# Now, copy data (or move) back once the simulation has completed
#
cp 100_tblastn.out $SLURM_SUBMIT_DIR/


