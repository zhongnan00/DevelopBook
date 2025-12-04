#!/bin/bash
rootDir=${PWD}
libDir=${rootDir}/icp_3720_v1/common/commonLib


commPath=${PWD}/common/device_pkg
mkdir -p ${commPath}

function build_3720(){
    
    cd ${PWD}/icp

    vtime=$(date +"%Y%m%d%H%M")
    build_time=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$build_time]    board 0 build sw now !"

    version=$(sed -n '19p' ./icpboard_128k/App/sw_type_define.h)
    echo ${version}
    BIN=$(echo $version |cut -d ' ' -f3)
    echo ${BIN}


    echo $PWD
    # ./build/build_cmd/linux_ubuntu.sh
    ./build/cmd/build_board_1.sh

    cd $PWD/build_output

    rm -rf icp_cpp
    
    dirName=icp_cpp_hw1_$(date +%Y%m%d_%H%M%S)
    pkgName=icp_cpp
    echo $pkgName
    mkdir -p $pkgName
    mkdir -p $pkgName/firmware
    mkdir -p $pkgName/aarch64
    echo "$build_time" > $pkgName/SwBuildTime.txt
    echo "[$build_time]    board 0 build sw now !" > $pkgName/SwBuildTime.txt

    cp ../icpboard_128k/Debug/icpboard_128k.bin $pkgName/firmware/icpboard_128k_${BIN}_${vtime}.bin
    cp -r app/aarch64_board_0/* $pkgName/aarch64
    cp ../install/3720Board/* $pkgName
    cp -r ../install/WIFI $pkgName
    cp -r ../install/*.sh $pkgName


    IPAdrr="10.152.177.45"
    tar -zcvf $dirName.tar.gz $pkgName 
    # scp -r $dirName.tar.gz liuchao@${IPAdrr}:/home/liuchao/docker_work/build_files/icp_3720
    # scp  ../install/3720Board/icp_sw_install.sh liuchao@${IPAdrr}:/home/liuchao/docker_work/build_files/icp_3720
    # rm  -rf icp_cpp_*

    mv  $dirName.tar.gz ${commPath}
    rm  -rf $dirName.tar.gz

    cp ../install/3720Board/icp_sw_install.sh ${libDir}

    cd ..

}


function main(){
    # bash web_device.sh
    build_3720

    cd ${rootDir}/common/icp_3720_v1
    bash pack_master.sh


}

## --------------------------------##
main