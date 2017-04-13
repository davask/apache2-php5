#/usr/bin/env bash

branch=${1};

if [[ "${branch}" != "4.4-a2.4-u12.04" ]] \
&& [[ "${branch}" != "4.4-a2.4-u14.04" ]] \
&& [[ "${branch}" != "5.5-a2.4-u14.04" ]] \
&& [[ "${branch}" != "5.6-a2.4-u14.04" ]] \
&& [[ "${branch}" != "5.6-ssl-a2.4-u14.04" ]] \
&& [[ "${branch}" != "5.6-letsencrypt-a2.4-u14.04" ]] \
&& [[ "${branch}" != "7.0-a2.4-u16.04" ]]; then

    echo "Php available: 4.4-a2.4-u12.04, 4.4-a2.4-u14.04, 5.5-a2.4-u14.04, 5.6-a2.4-u14.04, 5.6-ssl-a2.4-u14.04, 5.6-letsencrypt-a2.4-u14.04, 7.0-a2.4-u16.04";
    exit 0;

fi

if [[ "${branch}" == "4.4-a2.4-u12.04" ]]; then
    parentRepo="d-apache";
    parentBranch="2.4-u12.04";
fi
if [[ "${branch}" == "4.4-a2.4-u14.04" ]]; then
    parentRepo="d-apache";
    parentBranch="2.4-u14.04";
fi
if [[ "${branch}" == "5.5-a2.4-u14.04" ]]; then
    parentRepo="d-apache";
    parentBranch="2.4-u14.04";
fi
if [[ "${branch}" == "5.6-a2.4-u14.04" ]]; then
    parentRepo="d-apache";
    parentBranch="2.4-u14.04";
fi
if [[ "${branch}" == "5.6-ssl-a2.4-u14.04" ]]; then
    parentRepo="d-apache-openssl";
    parentBranch="2.4-u14.04";
fi
if [[ "${branch}" == "5.6-letsencrypt-a2.4-u14.04" ]]; then
    parentRepo="d-apache-letsencrypt";
    parentBranch="2.4-u14.04";
fi
if [[ "${branch}" == "7.0-a2.4-u16.04" ]]; then
    parentRepo="d-apache";
    parentBranch="2.4-u16.04";
fi

thisDir=`readlink -m "${PWD}"`;
rootDir="${thisDir}";
buildDir=`readlink -m "${thisDir}/build"`;

. ./script/Dockerfile.sh ${branch} ${parentRepo} ${parentBranch} ${rootDir} ${buildDir}
. ./script/README.sh ${branch} ${parentRepo} ${parentBranch} ${rootDir} ${buildDir}
. ./script/docker-compose.sh ${branch} ${parentRepo} ${parentBranch} ${rootDir} ${buildDir}

sudo docker build -t davask/d-php:${branch} ${thisDir};

echo "sudo docker run --name d-php -tdi -p 65500:80/tcp -p 65502:22/tcp -p 65503:443/tcp davask/d-php:${branch}";


exit 1;
