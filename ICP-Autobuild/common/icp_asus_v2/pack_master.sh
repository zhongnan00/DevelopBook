#!/bin/bash

version="v1.0.3"

rootDir=${PWD}
packPath=${PWD}/build_output

mkdir -p release_package
package_dir=${rootDir}/release_package

# copy the client code to the release directory
vtime=$(date +"%Y%m%d_%H%M%S")

dir_name="icp_sw_hw2_${vtime}_${version}"
Relase_dir="Release_hw2_${vtime}"
mkdir -p ${package_dir}/${Relase_dir}

target_dir=${package_dir}/${Relase_dir}

# cp icp_sw_install.sh commonLib

CppFile=$(ls -t   ../device_pkg/icp_cpp_*.tar.gz |head -n 1)
PrimeFile=$(ls -t ../device_pkg/icp-server_*_prime.tar.gz |head -n 1)
echo ${PrimeFile}
# EliteFile=$(ls -t ../device_pkg/icp-server_*_elite.tar.gz |head -n 1)
# echo ${EliteFile}
# EliteAFile=$(ls -t ../device_pkg/icp-server_*_eliteA.tar.gz |head -n 1)
# echo ${EliteAFile}
# EliteWFile=$(ls -t ../device_pkg/icp-server_*_eliteW.tar.gz |head -n 1)
# echo ${EliteWFile}

function build_client_code() {

    # mkdir -p  ${target_dir}/${dir_name}_elite
    # mkdir -p  ${target_dir}/${dir_name}_eliteA
    # mkdir -p  ${target_dir}/${dir_name}_eliteW
    mkdir -p  ${target_dir}/${dir_name}_prime

    # cp  -r commonLib/*      ${target_dir}/${dir_name}_elite/
    # cp  ${CppFile}    	    ${target_dir}/${dir_name}_elite/
    # cp  ${EliteFile}        ${target_dir}/${dir_name}_elite/

    # cp  -r commonLib/*      ${target_dir}/${dir_name}_eliteA/
    # cp  ${CppFile}          ${target_dir}/${dir_name}_eliteA/
    # cp  ${EliteAFile}       ${target_dir}/${dir_name}_eliteA/

    # cp  -r commonLib/*      ${target_dir}/${dir_name}_eliteW/
    # cp  ${CppFile}          ${target_dir}/${dir_name}_eliteW/
    # cp  ${EliteWFile}       ${target_dir}/${dir_name}_eliteW/

    cp  commonLib/*         ${target_dir}/${dir_name}_prime/
    cp  ${CppFile}          ${target_dir}/${dir_name}_prime/
    cp  ${PrimeFile}        ${target_dir}/${dir_name}_prime/

    echo "Directory ${dir_name} created successfully!"
}



build_client_code










