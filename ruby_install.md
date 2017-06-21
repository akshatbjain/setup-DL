### Instructions for dowloading Ruby 2.2       

- Install ruby2.2                              

`sudo apt-add-repository ppa:brightbox/ruby-ng`                                 
`sudo apt-get update`                                 
`sudo apt-get install ruby2.2 ruby2.2-dev`                                            

- Download RubyGems, which is a package management framework for Ruby, clone the rubygems repo          

`git clone https://github.com/rubygems/rubygems.git`             
update submodules           
`git submodule update -\-init`                    
no install the gems           
`sudo ruby setup.rb`           

### Instructions for jekyll           

- Install jekyll                     
 `sudo gem install jekyll`           

If jeykll is not working, then create a symbolic link               
find where is jeykll                 
`which jeykll`                    
and then create a symbolic link                   
`sudo ln -s [path to jeykll] /usr/bin/jekyll`                
*usually jekyll is at `/usr/local/bin/jekyll`*

**Install bundler**          
 `sudo gem install bundler`                      
