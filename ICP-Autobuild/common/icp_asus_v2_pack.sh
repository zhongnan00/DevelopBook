#!/bin/bash
rootDir=${PWD}
libDir=${rootDir}/icp_asus_v2/common/commonLib



commPath=${PWD}/common/device_pkg
mkdir -p ${commPath}

function build_release_package(){
    cd ${PWD}/icp

    vtime=$(date +"%Y%m%d%H%M")
    build_time=$(date +"%Y-%m-%d %H:%M:%S")

    version=$(sed -n '19p' ./icpboard_128k/App/sw_type_define.h)
    echo $version
    BIN=$(echo $version |cut -d ' ' -f3)
    echo $BIN


    echo $PWD
    # ./build/build_cmd/linux_ubuntu.sh
    ./build/cmd/build_board_2.sh

    cd $PWD/build_output

    rm -rf icp_cpp
    
    dirName=icp_cpp_hw2_$(date +%Y%m%d_%H%M%S)
    pkgName=icp_cpp
    echo $pkgName
    mkdir -p $pkgName
    mkdir -p $pkgName/firmware
    mkdir -p $pkgName/aarch64


    echo "$build_time" > $pkgName/SwBuildTime.txt
    echo "[$build_time]    board 2 build sw now !" > $pkgName/SwBuildTime.txt

    # cp ../firmware/icp_boot_and_app*.bin $pkgName/firmware
    cp ../icpboard_128k/Debug/icpboard_128k.bin $pkgName/firmware/icpboard_128k_${BIN}_${vtime}.bin
    chmod 777 $pkgName/firmware/icpboard_128k_${BIN}_${vtime}.bin

    cp ../icpboard_128k/Debug/icpboard_128k.bin $pkgName/firmware/backup_app_firmware.bin
    chmod 777 $pkgName/firmware/backup_app_firmware.bin

    cp -r app/aarch64_board_2/* $pkgName/aarch64
    cp ../install/AsusBoard/* $pkgName

    IPAdrr="10.152.65.128"
    tar -zcvf $dirName.tar.gz $pkgName 
    # scp -r $dirName.tar.gz liuchao@${IPAdrr}:/home/liuchao/docker_work/build_files/icp_3720_AsusDev
    # scp -r ../install/AsusBoard/icp_sw_install.sh liuchao@${IPAdrr}:/home/liuchao/docker_work/build_files/icp_3720_AsusDev

    # rm  -rf icp_cpp_*
    mv  $dirName.tar.gz ${commPath}
    rm  -rf $dirName.tar.gz

    rm  -rf $dirName.tar.gz
    cd ..

}


function main(){

    build_release_package
    cd ${rootDir}/common/icp_asus_v2
    bash pack_master.sh
}

## --------------------------------##
main