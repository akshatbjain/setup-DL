#!/bin/bash
## Usage: bash nvidia_cuda.sh
## Author: sumanth
## Purpose: setups the system for ihmc controllers
##
## Options:
##   none
##

echo "$(tput setaf 1)download theano$(tput sgr0)"
cd
wget https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh 
bash Anaconda2-4.1.1-Linux-x86_64.sh

echo "$(tput setaf 1)update conda and install theano$(tput sgr0)"
conda update conda
conda install theano

echo "$(tput setaf 1)Install keras$(tput sgr0)"
conda install --channel https://conda.anaconda.org/KEHANG keras

echo "$(tput setaf 1)update theano$(tput sgr0)"
pip install --upgrade --no-deps theano
    
echo "$(tput setaf 1)generating script to test gpu $(tput sgr0)"
echo "
from theano import function, config, shared, sandbox
import theano.tensor as T
import numpy
import time
 
vlen = 10 * 30 * 768  # 10 x #cores x # threads per core
iters = 1000
 
rng = numpy.random.RandomState(22)
x = shared(numpy.asarray(rng.rand(vlen), config.floatX))
f = function([], T.exp(x))
print(f.maker.fgraph.toposort())
t0 = time.time()
for i in range(iters):
    r = f()
t1 = time.time()
print("Looping %d times took %f seconds" % (iters, t1 - t0))
print("Result is %s" % (r,))
if numpy.any([isinstance(x.op, T.Elemwise) for x in f.maker.fgraph.toposort()]):
    print('Used the cpu')
else:
    print('Used the gpu')
" >> gpu_check.py
    
python gpu_check.py
  
#if it shows using cpu, then do the following 

echo "$(tput setaf 1)create theanorc$(tput sgr0)"
cd
echo "
[blas]
ldflags =
 
[global]
floatX = float32
device = gpu
 
# By default the compiled files were being written to my local network drive.
# Since I have limited space on this drive (on a school's network),
# we can change the path to compile the files on the local machine.
# You will have to create the directories and modify according to where you
# want to install the files.
# Uncomment if you want to change the default path to your own.
# base_compiledir = /local-scratch/jer/theano/
 
[nvcc]
fastmath = True
 
[gcc]
cxxflags = -ID:\MinGW\include
 
[cuda]
# Set to where the cuda drivers are installed.
# You might have to change this depending where your cuda driver/what version is installed.
root=/usr/local/cuda-8.0/
" >> theano.rc

