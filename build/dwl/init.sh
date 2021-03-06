#!/bin/bash

cd ~/;

dwlDir="/dwl";

. ${dwlDir}/envvar.sh
. ${dwlDir}/user.sh
. ${dwlDir}/ssh.sh
echo ">> Os initialized";

if [ ! -f /home/${DWL_USER_NAME}/.bash_profile ]; then
    sudo cp /home/admin/.bash_profile /home/${DWL_USER_NAME};
fi
echo ">> Base initialized";

. ${dwlDir}/permission.sh
echo ">> Permission assigned";

. ${dwlDir}/apache2.sh
echo ">> Apache2 initialized";

if [ "${DWL_APACHEGUI}" == "true" ]; then
    cd /opt/ApacheGUI/bin;
    ./run.sh
    echo ">> ApacheGUI started";
    cd ~/
fi

. ${dwlDir}/php.sh
echo ">> Php initialized";

. ${dwlDir}/custom.sh
echo ">> custom initialized";

if [ "`dpkg --get-selections | awk '{print $1}' | grep sendmail$ | wc -l`" == "1" ]; then
  sudo service sendmail start;
  echo ">> Sendmail initialized";
fi

tail -f /dev/null;
