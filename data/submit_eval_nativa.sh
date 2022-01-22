#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno02/lab5-container/data
#SBATCH -J lab5_mariabelen
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END #END/START/NONE
#SBATCH --mail-user=mariabelen.barquerom@um.es
#SBATCH --output=RESULTADOS.txt

# Affinity
#export KMP_AFFINITY=granularity=fine,compact

# Number of threads
#export OMP_NUM_THREADS=32
#16,32

# Tiempo de ejecución para python
echo "EJECUTANDO CON PYTHON"

echo "k-mer13 con Python"
time ./k-mer13.py
echo "K-mer14 con Python"
time ./k-mer14.py

# Tiempo de ejecución  C++
echo "EJECUTANDO CON C++"

echo "k-mer13 con C++"
time ./k-mer13
echo "k-mer14 con C++"
time ./k-mer14
