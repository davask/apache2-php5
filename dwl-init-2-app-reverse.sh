#!/bin/bash
echo "PROCESSING ENV VAR TO /tmp/dwl_app_projects.yml";
/tmp/dwl-env2yaml-0-app.sh
echo "PROCESSING /tmp/dwl_app_projects.yml TO VIRTULHOSTS";
perl /tmp/dwl-yaml2virtualhost-0-app.pl
