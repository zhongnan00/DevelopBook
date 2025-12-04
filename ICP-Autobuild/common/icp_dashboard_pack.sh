#!/bin/bash

# packPath=/home/${USER}/docker_work/build_files/icp_java
packPath=${PWD}/dashboard_pkg
mkdir -p ${packPath}
# rm -rf ${packPath}/icpDashboard_*

bash ${PWD}/web_dashboard.sh

function mavenCmd(){

    cd ICP-Java-Server
    echo "${PWD}"
    mvn compile
    mvn clean package

    Time=$(date +"%Y%m%d_%H%M%S")
    dirName=icpDashboard_${Time}
    packName=${packPath}/${dirName}
    echo "package start:${packName}"

    targetDir=${packName}
    mkdir -p ${targetDir}

    cp template/*.sh         ${targetDir}
    cp template/*.service    ${targetDir}
    cp target/*.jar          ${targetDir}
    cp template/*.zip        ${targetDir}
    cp template/*.tar.gz     ${targetDir}
    mv ${packPath}/dashboard_*.tar.gz  ${targetDir}

    echo "package over:${targetDir}"

    cd ${packPath}
    # scp -r ${dirName} liuchao@10.152.177.44:/home/liuchao/shared/ICP-Package/icp_dashboard_pkg
}

mavenCmd