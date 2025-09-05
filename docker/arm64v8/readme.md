# docker arm64v8

## daemon.json
```shell
# edit /etc/docker/daemon.json
{
  "experimental": true,
  "features": {
    "buildkit": true
  }
}

# restart docker
sudo systemctl restart docker



```

## QEMU

```shell
sudo apt-get update
sudo apt-get install qemu-user-static
sudo apt-get install binfmt-support

# add arm64 to binfmt
sudo update-binfmts --enable qemu-arm

# register qemu simulator
docker run --rm --privileged multiarch/qemu-user-static:register --reset


```

## pull
```shell
docker pull arm64v8/ubuntu:latest

# or

docker pull --platform linux/arm64/v8 arm64v8/ubuntu:latest


```

## run
```shell
docker run -it --rm arm64v8/ubuntu:latest bash

docker run -it --rm -v /home/liuchao/aarch64v8:/home/repo arm64v8/ubuntu:20.04 bash


## check
uname -m
cat /etc/os-release
apt update
apt install -y neofetch

```

