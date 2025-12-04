#!/bin/bash
packPath=${PWD}/common/device_pkg
mkdir -p ${packPath}
# rm -rf ${packPath}/icp-server*.tar.gz

nodePath=/home/repo/icp-server
webPath=/home/repo/icp-client


build_chart_sw(){
    echo "$1"
    version=$1
    rm -rf chart
    
    cd ${webPath}
    npm run $version
}


build_web_sw(){
    echo "$1"
    version=$1
    rm -rf web
    
    cd ${webPath}
    npm run $version

    cd ${nodePath}
    rm -rf dist
    echo "正在运行 yarn $1 ... "
    yarn build
    echo "运行完毕"

    cp -r ${webPath}/web ./dist
    cp server.js ./dist
    cp package.json ./dist

    cd dist
    rm -rf *.tar.gz
    tar zcvf icp-server.tar.gz http-server/ persistence/ functions/ web/ package.json
    timer=$(date +"%Y%m%d_%H%M%S")
    name=icp-server_${timer}_${version}
    mv icp-server.tar.gz $name.tar.gz
    # scp $name.tar.gz liuchao@10.152.177.45:/home/liuchao/docker_work/build_files/webcode
    # scp $name.tar.gz liuchao@10.152.177.44:/home/liuchao/shared/ICP-Package/webcode
    mv $name.tar.gz ${packPath}
    echo "web server:${name} package over!"
}

# build_web_sw "elite"
# build_web_sw "eliteA"
# build_web_sw "eliteW"
build_web_sw "prime"


