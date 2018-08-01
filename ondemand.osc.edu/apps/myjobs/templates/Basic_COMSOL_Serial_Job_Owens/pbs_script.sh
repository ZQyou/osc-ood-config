#PBS -N #PBS -N ondemand/sys/myjobs/basic_comsol_serial
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -l software=comsolscript

#   A Basic COMSOL Serial Job for the OSC Owens Cluster
#   https://www.osc.edu/resources/available_software/software_list/comsol

#
# The following lines set up the COMSOL environment
#
module load comsol
#
# Move to the directory where the job was submitted
#
cd $PBS_O_WORKDIR
cp Laplace.mph $TMPDIR
cd $TMPDIR
#
# Run COMSOL
#
comsol batch -inputfile Laplace.mph
#
# Now, copy data (or move) back once the simulation has completed
#
cp * $PBS_O_WORKDIR
