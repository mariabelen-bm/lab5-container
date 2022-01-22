#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno02/lab5-container/
#SBATCH -J lab5_singularity_mariabelen
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END #END/START/NONE
#SBATCH --mail-user=mariabelen.barquerom@um.es
#SBATCH --output=output_manejando_container.sh

# Affinity
#export KMP_AFFINITY=granularity=fine,compact

# Number of threads
#export OMP_NUM_THREADS=32
#16,32

# Cargamos el módulo de singularity

module add singularity/3.8.0

echo "a) La versión del sistema operativo de la imagen"
echo "La versión del sistema operativo es: "
singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif cat /etc/os-release

echo "b) El contenido del directorio que estamos viendo"

singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ls

echo "c) El path del directorio que estamos viendo"

singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif pwd

echo "d) La versión de python que hemos instalado"
echo "La versión de python es :"
singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif python --version

echo "e) La versión del compilador de C++ que tenemos instalada con el siguiente comando g++ -version"
echo "La versión de C++ es: "
singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif g++ --version

echo "f) Ejecuta el k-mers de longitud 13 compilado de C++ y mide el tiempo de ejecución (¡ojo!, no lo hagas con los porgramas escritos en python, pues son mucho más lentos y nos colapsarán el nodo de entrada al clúster)"

time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ./data/k-mer13

# Descargamos el módulo de singularity

module unload singularity/3.8.0
