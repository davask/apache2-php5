# dockerfile

[![[dwl] php:5.6-a2.4-d8.8 in prod][badge-shields]](https://hub.docker.com/r/davask/d-php/)
[![[dwl] php:5.6-a2.4-d8.8 license][badge-license]](https://app.fossa.io/projects/git%2Bhttps%3A%2F%2Fgithub.com%2Fdavask%2Fd-php?ref=badge_shield)

[![[dwl] php:5.6-a2.4-d8.8 image][badge-docker]](https://hub.docker.com/r/davask/d-php/)

[badge-docker]: https://dockeri.co/image/davask/d-php "[dwl] php:5.6-a2.4-d8.8 image"
[badge-shields]: https://img.shields.io/badge/davask%2Fd--php-env_prod-brightgreen.svg?style=flat "[dwl] php:5.6-a2.4-d8.8 in prod"
[badge-license]: https://img.shields.io/badge/davask%2Fd--php-license_MIT-brightgreen.svg?style=flat "[dwl] php:5.6-a2.4-d8.8 license"

## Exposed port

- 22
- 80
## Default ENV values

- DWL_LOCAL_LANG: 'en_US:en'
- DWL_LOCAL: 'en_US.UTF-8'
- DWL_USER_NAME: 'username'
- DWL_USER_PASSWD: 'secret'
- DWL_USER_ID: '1000'
- DWL_SUDO_USER: 'false'
- DWL_SSH_ACCESS: 'false'
- APACHE_LOCK_DIR: '/var/lock/apache2'
- APACHE_PID_FILE: '/var/run/apache2.pid'
- APACHE_RUN_USER: 'www-data'
- APACHE_RUN_GROUP: 'www-data'
- APACHE_LOG_DIR: '/var/log/apache2'
- APACHE_RUN_DIR: '/var/run/apache2'
- DWL_HTTP_SERVERADMIN: 'admin@localhost'
- DWL_HTTP_DOCUMENTROOT: '/var/www'
- DWL_HTTP_SHIELD: 'false'
- DWL_PHP_DATETIMEZONE: 'Europe/Paris'
## Available volumes

- /home/host
- /etc/apache2/sites-available
## LABEL

- dwl.server.os="apache 5.6-a2.4-d8.8"

- dwl.server.base="php 5.6-a2.4-d8.8"

- dwl.server.http="apache 5.6-a2.4-d8.8"

## EXTRA

