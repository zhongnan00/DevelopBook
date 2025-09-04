# power on run script

## 1. write a script 
```shell
/usr/local/bin/***.sh
```

## 2. example
```shell

#!/bin/bash

export XDG_RUNTIME_DIR=/run/user/0
export QT_QPA_PLATFORM=wayland-egl

cd /home/root/
./myApp


```

## 3. create my.serivice
```shell
# use desktop service to run app
cd /etc/systemd/system
# create a user service
touch my.service
# vi my.service

```

## 4. edit my.service
```shell
root@imx8mprsb3720a1:/etc/systemd/system# cat icp.client.service

[Unit]
Description=icpclient
After=weston@root.service
Requires=weston@root.service

[Service]
Type=forking
ExecStart=/home/root/start-chromium.sh
#Restart=always
#RestartSec=5

[Install]
WantedBy=multi-user.target

```

## 5. edit start-chromium.sh
```shell
root@imx8mprsb3720a1:/etc/systemd/system# cat /home/root/start-chromium.sh
#!/bin/sh
if test -z "$XDG_RUNTIME_DIR"; then
    export XDG_RUNTIME_DIR=/run/user/`id -u`
    if ! test -d "$XDG_RUNTIME_DIR"; then
        mkdir --parents $XDG_RUNTIME_DIR
        chmod 0700 $XDG_RUNTIME_DIR
    fi
fi

export DISPLAY=:0.0

/usr/bin/chromium --no-sandbox --kiosk http://localhost:3000/home &


```
