#!/bin/bash
build_output=${PWD}/dashboard_pkg
mkdir -p ${build_output}

nodePath=/home/repo/icp-dashboard-server
webPath=/home/repo/icp-dashboard

build_web_sw(){
    echo "$1"
    version=$1
    rm -rf web
    
    cd ${webPath}
    npm run $version

    cd ${nodePath}
    rm -rf dist
    npm run build
    cp -r ${webPath}/web ./dist

    cp package.json ./dist
    cp config.json ./dist
    # cp system.db ./dist
    # cp startup.bat ./dist
    # cp nodejs.tar.gz ./dist
    # cp node_modules.tar.gz ./dist
    # cp ubuntu_icp-dashboard-server.tar.gz ./dist

    rm -rf dashboard*.tar.gz

    tar zcvf dashboard.tar.gz dist/
    timer=$(date +"%Y%m%d_%H%M%S")
    name=dashboard_${timer}_${version}
    mv dashboard.tar.gz $name.tar.gz

    mv $name.tar.gz ${build_output}/

    # scp $name.tar.gz liuchao@10.152.177.45:/home/liuchao/docker_work/build_files/webcode
    # scp $name.tar.gz liuchao@10.152.177.44:/home/liuchao/shared/ICP-Package/webcode

    rm -rf dist

    echo "web:${name} package over!"
}

build_web_sw "build"
