#! /bin/bash

sed -i "s|;date.timezone =|date.timezone = ${DWL_DATE_TIMEZONE}|g" /etc/php/5.6/apache2/php.ini
