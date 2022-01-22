#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno02/lab5-container/
#SBATCH -J lab5_singularity_mariabelen
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END #END/START/NONE
#SBATCH --mail-user=mariabelen.barquerom@um.es
#SBATCH --output=output_resultados

# Affinity
#export KMP_AFFINITY=granularity=fine,compact

# Number of threads
#export OMP_NUM_THREADS=32
#16,32

# Cargamos el módulo de singularity
module add singularity/3.8.0

echo "Tiempo de ejecución para longitud 13 con Python"
echo "                                "
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ./data/k-mer13.py
echo "                                "

echo "Tiempo de ejecución para longitud 14 con Python"
echo "                                "
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ./data/k-mer14.py
echo "                                "

echo "Tiempo de ejecución para longitud 13 con C++"
echo "                                "
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ./data/k-mer13
echo "                                "

echo "Tiempo de ejecución para longitud 14 con C++"
echo "                                "
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ./data/k-mer14
echo "                                "

# Descargamos el módulo de singularity
module unload singularity/3.8.0
