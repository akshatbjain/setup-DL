## Installing Nvidia driver and Cuda
###### This is specifically done for *Nvidia-GTX960* graphic card on *lenovoY700*

1.download the cuda from here [link](https://developer.nvidia.com/cuda-downloads) 

2.Install build-essential                    
`sudo apt-get install build-essential`

3.black list nouveau, create the file /etc/modprobe.d/blacklist-nouveau.conf               
`vi /etc/modprobe.d/blacklist-nouveau.conf`
```
blacklist nouveau                
options nouveau modeset=0                   
```
Then `sudo update-initramfs -u`                 

4.reboot           
`sudo reboot`                  

** The above steps can be run using the below script:**
`bash nvidia_cuda.sh`
after reboot follow the below instructions

5.login                

6.`ctrl+alt+f1` and login          

7.got to dowloaded cuda.run file                  

8.make it executable                  
`chmod +x`                        

9.stop lightdm                      
`sudo service lightdm stop`         

10.run cuda.run with out opengl                      
`sudo bash cuda-7.0.28_linux.run --no-opengl-libs`                     

 > **while installing:**                      
 > *accept* EULA agreement                            
 > *yes* for installing nvidia driver                
 > *No* for changin nvidia xconf                 
 > *yes* for installing cuda        
 > *yes* for enter tool kit location (will use default location, or change it)                           
 > *yes* for symbolic link                            
 > *yes* for installing cuda samples                                  
 > *yes* for enter cuda sample locations (will use default location, or change it)                                            

11.Set Environment path variables:                
`export PATH=/usr/local/cuda-8.0/bin:$PATH`         
`export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH`       

12.Verify the driver version:        
`cat /proc/driver/nvidia/version`          
 
13.Check CUDA driver version:                         
`nvcc -V`                                      

14.start lightdm           
`sudo service lightdm start`                

15.got cuda samples                            
`cd NVIDIA_CUDA-8.0_Samples/`          

16.then make                                  
`make`                

17.Go to `NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/` do the two standard checks:                   
⋅⋅* `./deviceQuery`                          
  to see your graphics card specs and                                  
⋅⋅* `./bandwidthTest`                         
  to check if its operating correctly.                         
   
18.add path in .bashrc                       
`export PATH=/usr/local/cuda/bin:/usr/local/cuda/lib64:$PATH`                          
`export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH`                 
