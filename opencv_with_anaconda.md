### Opencv with anaconda

1. for installation of anaconda check link (Theano, anaconda, keras installation)
2. Download opencv from website [link] (https://sourceforge.net/projects/opencvlibrary/)
3. extract the zip to opencv 
4. change directory to opencv
`cd ~/opencv`
5. create a folder for build files
`mkdir release`
`cd release`
6. generate make files with the below cmake command **(give path to anaconda instead of native python)**
```
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D WITH_V4L=ON  \
    -D INSTALL_C_EXAMPLES=ON  \
    -D INSTALL_PYTHON_EXAMPLES=ON  \
    -D BUILD_EXAMPLES=ON \
    -D PYTHON_INCLUDE_DIR=/home/$USER/anaconda2/include/python2.7 \
    -D PYTHON_INCLUDE_DIR2=/home/$USER/anaconda2/include/python2.7 \
    -D PYTHON_LIBRARY=/home/$USER/anaconda2/lib/libpython2.7.so  \
    -D PYTHON_PACKAGES_PATH=/home/$USER/anaconda2/lib/python2.7/site-packages \
     ..
```
7.make and install                      
`make`  
`install`
