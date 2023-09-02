#! /bin/sh

#SBATCH --nodes={experiment.nodes}
#SBATCH --ntasks={experiment.ntasks}
#SBATCH --time=01:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --reservation=bi_fox_dgx
#SBATCH --gres=gpu:{experiment.gpus}
#SBATCH --job-name=pytorch-gpu
#SBATCH --output=multigpu-%u-%j.out
#SBATCH --error=multigpu-%u-%j.err

### the output and error dir are not set 

hostname
echo "SLURM_CPUS_ON_NODE: $SLURM_CPUS_ON_NODE"
echo "SLURM_CPUS_PER_GPU: $SLURM_CPUS_PER_GPU"
echo "SLURM_GPU_BIND: $SLURM_GPU_BIND"
echo "SLURM_JOB_ACCOUNT: $SLURM_JOB_ACCOUNT"
echo "SLURM_JOB_GPUS: $SLURM_JOB_GPUS"
echo "SLURM_JOB_ID: $SLURM_JOB_ID"
echo "SLURM_JOB_PARTITION: $SLURM_JOB_PARTITION"
echo "SLURM_JOB_RESERVATION: $SLURM_JOB_RESERVATION"
echo "SLURM_SUBMIT_HOST: $SLURM_SUBMIT_HOST"


echo "Working in $(pwd)"
# echo "Repository Revision: $(git rev-parse HEAD)"
# echo "Python Version: $(singularity exec mnist.sif python --version)"
# echo "Running on host: $(hostname -a)"

module purge
module load singularity

echo "checking singularity..."
which singularity

echo "SHOULD HAVE 2 GPUs"
nvidia-smi

echo "checking python..."
singularity exec pytorch.sif python --version

echo "executing..."
# What is p1 and p2 really standing for, use proper names.
singularity exec --nv pytorch.sif python multigpu.py {experiment.p1} {experiment.p2}

echo "==================================================="
seff $SLURM_JOB_ID
