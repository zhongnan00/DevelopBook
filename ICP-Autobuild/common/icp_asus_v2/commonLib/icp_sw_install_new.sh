#!/bin/bash
echo "********************install start****************************"

DIR=/home/${USER}/package
userDir=/home/root
workDir=/home/root/work

mkdir -p ${DIR}
sudo mkdir -p ${userDir}
sudo chmod 777 -R ${userDir}
mkdir -p ${workDir}


sudo pkill -f node
sleep 0.1
sudo pkill -f chromium
sleep 0.1

sudo systemctl stop icp.browser.service
sleep 1
sudo systemctl stop icp.node.service
sleep 1
sudo systemctl stop icp.data.service


sleep 1

sudo systemctl stop icp.browser.service
sleep 1
sudo systemctl stop icp.node.service
sleep 1
sudo systemctl stop icp.data.service

sleep 1

sudo pkill -f node
sleep 0.1
sudo pkill -f chromium
sleep 0.1
sudo pkill -f stm32_sensor_main
sleep 0.1
sudo pkill -f ut_bootloader
sleep 0.1
sudo pkill -f filter_app
sleep 0.1
sudo pkill -f log_manager_app
sleep 0.1
sudo pkill -f mydatabase_system
sleep 0.1
sudo pkill -f mydatabase_app 
sleep 0.1
sudo pkill -f wsServer_app
sleep 0.1 
sudo pkill -f wsDatabase_app



sudo rm -rf ${DIR}/*
sudo rm -rf /home/root/work/*
sudo rm -rf $workDir/firmware/*

mkdir -p $userDir/work
mkdir -p $userDir/log
mkdir -p $userDir/database
mkdir -p $userDir/screenshot
mkdir -p $userDir/rawdata
mkdir -p $userDir/alarm_log
mkdir -p $userDir/system
mkdir -p $userDir/node_log

echo "cp package ..."

cp icp_cpp_*.tar.gz ${DIR}
sync

cp icp-server*.tar.gz  ${DIR}
sync

cp node_modules.tar.gz ${DIR}
sync

cp zip3-0.tar.gz ${DIR}
sync

cd ${DIR}

echo "unzip package ..."

if which zip >/dev/null;then
    echo "zip is exist..."
else
    tar zxvf zip3-0.tar.gz -C /
    sync
fi

mv icp_cpp_*.tar.gz icp_cpp.tar.gz
sync
mv icp-server*.tar.gz  icp-server.tar.gz
sync

mkdir -p icp-server 
tar zxvf icp-server.tar.gz -C icp-server 
tar zxvf node_modules.tar.gz 
mv  node_modules icp-server
sync
tar zxvf icp_cpp.tar.gz 


mv icp-server  /home/root/work
mv icp_cpp/*   /home/root/work

cd /home/root/work
bash setup.sh

cd /home/root/work
# bash fan_run.sh &

bash start.sh &

sleep 2

# cd /home/root/work/icp-server
# node server.js &
# npm start &
/usr/bin/chromium --no-sandbox \
                  --disable-pinch \
                  --overscroll-history-navigation=0 \
                  --touch-events \
                  --disable-web-security \
                  --user-data-dir='/home/root/work/icp-server/web' \
                  --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT'  \
                  file:///home/root/work/icp-server/web/index.html &

# scp scripts/icp_sw_install.sh liuchao@10.152.176.228:/home/liuchao/docker_work/build_files/icp_release_sw

echo "********************install end****************************"