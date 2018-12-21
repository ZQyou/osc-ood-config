#PBS -N ondemand/sys/myjobs/basic_qchem
#PBS -l walltime=0:59:00
#PBS -S /bin/csh
#PBS -j oe
#PBS -l nodes=1:ppn=1
#
# This is a sample script for running a basic Q-Chem job.
# The only thing you need to modify is 'sample' here:
#
setenv JOBNAME sample
#
# replace 'sample' with the actual name of your input file.
#
module purge
module load intel/18.0.4 mvapich2/2.3 qchem/5.1.1

# copy the contents to TMPDIR
cp $PBS_O_WORKDIR/* $TMPDIR
cd $TMPDIR

# QChem guide at
#   http://www.q-chem.com/qchem-website/manual/qchem43_manual/sect-running.html

# save input files:
# qchem -save $JOBNAME.inp $JOBNAME.out $JOBNAME
# do not save input files:
qchem $JOBNAME.inp $JOBNAME.out

cp $TMPDIR/* $PBS_O_WORKDIR
