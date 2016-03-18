#!/bin/bash

running_project=""

echo "" > /tmp/dwl_app_projects.yml;

for dwl_app_virtualhost_data in `env | grep DWL_APP_ | sort`; do

    echo "> Adding $dwl_app_virtualhost_data";
    dwl_app_virtualhost_envvar=`echo ${dwl_app_virtualhost_data} | cut -d'=' -f1`;
    dwl_app_virtualhost_settings=`echo ${dwl_app_virtualhost_envvar} | sed 's/DWL_APP_//g'`;
    dwl_app_virtualhost_values=`echo ${dwl_app_virtualhost_data} | cut -d'=' -f2`;
    dwl_app_virtualhost_name=`echo ${dwl_app_virtualhost_settings} | cut -d'_' -f1`;
    dwl_app_virtualhost_env=`echo ${dwl_app_virtualhost_settings} | cut -d'_' -f2`;
    dwl_app_virtualhost_subdomain=`echo ${dwl_app_virtualhost_values} | cut -d'|' -f1`;
    dwl_app_virtualhost_domain=`echo ${dwl_app_virtualhost_values} | cut -d'|' -f2`;
    dwl_app_virtualhost_port=`echo ${dwl_app_virtualhost_values} | cut -d'|' -f3`;

    if [ "${dwl_app_virtualhost_name}" != "${running_project}" ]; then
        running_project="${dwl_app_virtualhost_name}";

        echo "- name: ${dwl_app_virtualhost_name}" >> /tmp/dwl_app_projects.yml;
        echo "  domain: \"${dwl_app_virtualhost_domain}\"" >> /tmp/dwl_app_projects.yml;
        echo "  env:" >> /tmp/dwl_app_projects.yml;
    fi

    echo "    - name: ${dwl_app_virtualhost_env}" >> /tmp/dwl_app_projects.yml;
    echo "      subdomain: ${dwl_app_virtualhost_subdomain}" >> /tmp/dwl_app_projects.yml;
    echo "      port: ${dwl_app_virtualhost_port}" >> /tmp/dwl_app_projects.yml;

done;
