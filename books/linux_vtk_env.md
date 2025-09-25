# Linux 
## Errors
```shell
# password
sudo passwd root

# dpkg
sudo apt-get install dpkg 

#nomachine
sudo dpkg -i nomachine_8.2.3_4_amd64.deb

#update python 
  106  python3 --version
  107  sudo add-apt-repository ppa:deadsnakes/ppa
  108  sudo apt update
  109  apt list| grep python3.10
  110  sudo apt-get install python3.10
  111  python3 --version
 
#python
  113  apt-get install python-dev
  114  sudo apt-get install python-dev
  115  sudo apt-get install python3-dev
  
# nvidia-smi
  118  sudo apt-get install libxrandr-dev
  123  sudo apt install nvidia-utils-515
  124  sudo apt install nvidia-utils-515-server
  135  sudo apt install nvidia-driver-515

```


# IGSTK
```shell
> https://github.com/Kitware/IGSTK/blob/master/Examples/Navigator/Navigator.cxx

```


## System Architecture
```shell
1. data source-> filter -> processing -> output
2. source->filer->mapper->actor->renderer->window



```