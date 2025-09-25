# readme

## repo download
```shell
# Advantech 3720
https://github.com/nxp-imx/linux-imx/tree/imx_5.4.70_2.3.0
```

## 1. install libs
sudo apt update
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
sudo apt install libglib2.0-dev libcairo2-dev libpango1.0-dev libatk1.0-dev libgdk-pixbuf2.0-dev libgtk-3-dev
sudo apt install libssl-dev libffi-dev python3-dev python3-pip
sudo apt install python3-cairocffi python3-gi python3-gi-cairo gir1.2-gtk-3.0
sudo apt install python3-pycairo python3-pygobject python3-pyxdg python3-xdg
sudo apt install flex bison
sudo apt install libxml2-dev libxslt1-dev
sudo apt install libjpeg-dev zlib1g-dev

## 2. build kernel
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- imx_v8_defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image -j$(nproc)
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dtbs -j$(nproc)
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules -j$(nproc)
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/class modules -j$(nproc)
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  modules_install INSTALL_MOD_PATH=rootfs_out -j$(nproc)
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/serial modules -j$(nproc)

## 3. install kernel
sudo cp arch/arm64/boot/Image /boot/Image-imx8mm
sudo cp arch/arm64/boot/dts/imx8mm-evk.dtb /boot/imx8mm-evk.dtb
sudo cp System.map /boot/System.map-imx8mm
sudo cp .config /boot/config-imx8mm

## 4. result 
/arch/arm64/boot/Image-imx8mm
/boot/imx8mm-evk.dtb
/arch/arm64/boot/dts/imx8mm-evk.dtb
drivers/**/*.ko


## command
```shell
 2000  sudo apt update
 2001  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- imx_v8_defconfig
 2002  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image -j$(nproc)
 2003  ls arch/arm64/boot/
 2004  ls -lh  arch/arm64/boot/
 2005  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dtbs -j$(nproc)
 2006  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules -j$(nproc)
 2007  ls
 2008  ls-lh
 2009  ls -lh
 2010  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/class modules -j$(nproc)
 2011  ls -lh
 2012  ls
 2013  ls -lh
 2014  scp drivers/usb/class/cdc-acm.ko root@10.152.65.171:/home/root
 2015  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  modules_install INSTALL_MOD_PATH=~/linux-imx-imx_5.4.70_2.3.0/rootfs -j$(nproc)
 2016  cd ..
 2017  ls
 2018  ls -lh
 2019  cd -
 2020  l
 2021  cd ~/linux-imx-imx_5.4.70_2.3.0/rootfs/
 2022  ls
 2023  cd -
 2024  ls
 2025  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  modules_install INSTALL_MOD_PATH=rootfs_out -j$(nproc)
 2026  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
 2027  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  modules_install INSTALL_MOD_PATH=rootfs_out -j$(nproc)
 2028  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/class modules -j$(nproc)
 2029  ls drivers/usb/serial/*.ko
 2030  ls drivers/usb/serial/
 2031  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/serial modules -j$(nproc)
 2032  ls drivers/usb/serial/
 2033  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
 2034  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/serial modules -j$(nproc)
 2035  ls drivers/usb/serial/
 2036  ls
 2037  gerep CH341 .config
 2038  grep CH341 .config
 2039  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
 2040  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/serial modules -j$(nproc)
 2041  find . -name "*.ko"
 2042  find . -name "*.ko" |grep ch
 2043  find . -name "*.ko" |grep ch341
 2044  gerep CH341 .config
 2045  grep CH341 .config
 2046  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/serial modules 
 2047  lsmod
 2048  lsmod |grep ch
 2049  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
 2050  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  M=drivers/usb/serial modules 
 2051  ls drivers/usb/serial/
 2052  ls drivers/usb/serial/*.ko
 2053  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- imx_v8_defconfig
 2054  gerep CH341 .config
 2055  grep CH341 .config
 2056  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig
 2057  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules -j$(nproc)

```