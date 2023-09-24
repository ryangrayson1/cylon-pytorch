#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --exclusive
#SBATCH --time=1:00:00
#SBATCH --partition=parallel
#SBATCH -A bii_dsc_community
#SBATCH --output=cylon-dist-%x-%j.out
#SBATCH --error=cylon-dist-%x-%j.err

module load gcc/11.2.0 openmpi/4.1.4 python/3.11.1

USER_PROJECT=/project/bii_dsc_community/$USER

source $USER_PROJECT/ENV/bin/activate

BUILD_PATH=$USER_PROJECT/cylon/build

export LD_LIBRARY_PATH=$BUILD_PATH/arrow/install/lib64:$BUILD_PATH/glog/install/lib64:$BUILD_PATH/lib64:$BUILD_PATH/lib:$LD_LIBRARY_PATH

which python gcc g++

mpirun -np 2 python cylon_simple.py
