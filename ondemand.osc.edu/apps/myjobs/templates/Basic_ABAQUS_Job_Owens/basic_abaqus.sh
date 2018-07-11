#PBS -N knee
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=1
#PBS -l software=abaqus+5
#PBS -j oe
#
# The following lines set up the ABAQUS environment
# Further Details at
#	https://www.osc.edu/supercomputing/software/abaqus
#
module load abaqu
#
# Move to the work directory
#
cd $PBS_O_WORKDIR
#
# Fetch input files
#
abaqus fetch job=knee_bolster
abaqus fetch job=knee_bolster_ef1
abaqus fetch job=knee_bolster_ef2
abaqus fetch job=knee_bolster_ef3
#
# Copy input files from work directory($PBS_O_WORKDIR) to $TMPDIR
#
cp *.inp $TMPDIR
#
# Move to $TMPDIR
#
cd $TMPDIR
#
# Run ABAQUS
#
abaqus job=knee_bolster interactive
#
# Now, copy data (or move) back once the simulation has completed
#
cp * $PBS_O_WORKDIR
