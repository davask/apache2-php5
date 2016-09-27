# dockerfile

see [FROM IMAGE README.md](https://github.com/davask/d-apache)

## Default ENV values

### Define PHP date.timezone

> DWL_DATE_TIMEZONE Europe/Paris

### PHP 5 activation

#### comment

- to avoid init error all conf file in /etc/apache2/sites-available have to be in the format of sub.domain.ext.conf like docker.davaskweblimited.com.conf

- On start all *.conf in /etc/apache2/sites-available are enabled

## LABEL

> dwl.app.language="php7"
