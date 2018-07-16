#PBS -l nodes=1:ppn=1
#PBS -l walltime=10:00
#PBS -N Blast
#PBS -S /bin/bash
#PBS -j oe

# A Basic BLAST Job for the OSC Owens Cluster
# https://www.osc.edu/resources/available_software/software_list/blast

module load blast
set -x

cd $PBS_O_WORKDIR
mkdir $PBS_JOBID

cp 100.fasta $TMPDIR
cd $TMPDIR
/usr/bin/time blastn -db nt -query 100.fasta -out test.out

cp test.out $PBS_O_WORKDIR/$PBS_JOBID
