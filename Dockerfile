FROM davask/d-apache:2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.language="php"

# Update packages
RUN /bin/bash -c 'apt-get update'
# INSTALL PHP5.5.9
# RUN apt-get install -y php5
# INSTALL PHP5.6.23
RUN /bin/bash -c 'apt-get install -y software-properties-common'
RUN /bin/bash -c 'add-apt-repository ppa:sergey-dryabzhinsky/php44'
RUN /bin/bash -c 'add-apt-repository ppa:sergey-dryabzhinsky/php44-modules'
RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install -y php44'
RUN /bin/bash -c 'apt-get install -y libapache2-mod-php44'
# RUN /bin/bash -c 'apt-get install -y php44-cgi'
# RUN /bin/bash -c 'apt-get install -y php44-cgi-daemon'
# RUN /bin/bash -c 'apt-get install -y php44-cli'
# RUN /bin/bash -c 'apt-get install -y php44-common'
# RUN /bin/bash -c 'apt-get install -y php44-dev'
# RUN /bin/bash -c 'apt-get install -y php44-docs'
# RUN /bin/bash -c 'apt-get install -y php44-mod-bcmath'
# RUN /bin/bash -c 'apt-get install -y php44-mod-bz2'
# RUN /bin/bash -c 'apt-get install -y php44-mod-calendar'
# RUN /bin/bash -c 'apt-get install -y php44-mod-curl'
# RUN /bin/bash -c 'apt-get install -y php44-mod-dba'
# RUN /bin/bash -c 'apt-get install -y php44-mod-dbase'
# RUN /bin/bash -c 'apt-get install -y php44-mod-domxml'
# RUN /bin/bash -c 'apt-get install -y php44-mod-exif'
# RUN /bin/bash -c 'apt-get install -y php44-mod-ftp'
# RUN /bin/bash -c 'apt-get install -y php44-mod-gd'
# RUN /bin/bash -c 'apt-get install -y php44-mod-gettext'
# RUN /bin/bash -c 'apt-get install -y php44-mod-gmp'
# RUN /bin/bash -c 'apt-get install -y php44-mod-iconv'
# RUN /bin/bash -c 'apt-get install -y php44-mod-imap'
RUN /bin/bash -c 'apt-get install -y php44-mod-mbstring'
RUN /bin/bash -c 'apt-get install -y php44-mod-mcrypt'
# RUN /bin/bash -c 'apt-get install -y php44-mod-mssql'
# RUN /bin/bash -c 'apt-get install -y php44-mod-mysql'
# RUN /bin/bash -c 'apt-get install -y php44-mod-openssl'
# RUN /bin/bash -c 'apt-get install -y php44-mod-pcntl'
# RUN /bin/bash -c 'apt-get install -y php44-mod-pgsql'
# RUN /bin/bash -c 'apt-get install -y php44-mod-posix'
# RUN /bin/bash -c 'apt-get install -y php44-mod-pspell'
# RUN /bin/bash -c 'apt-get install -y php44-mod-readline'
# RUN /bin/bash -c 'apt-get install -y php44-mod-recode'
# RUN /bin/bash -c 'apt-get install -y php44-mod-snmp'
# RUN /bin/bash -c 'apt-get install -y php44-mod-tokenizer'
# RUN /bin/bash -c 'apt-get install -y php44-mod-wddx'
RUN /bin/bash -c 'apt-get install -y php44-mod-xml'
# RUN /bin/bash -c 'apt-get install -y php44-mod-xmlrpc'
# RUN /bin/bash -c 'apt-get install -y php44-mod-zip'
# RUN /bin/bash -c 'apt-get install -y php44-pear'
# RUN /bin/bash -c 'apt-get install -y php44-pecl'

RUN /bin/bash -c 'apt-get install -y php44-json'

# RUN /bin/bash -c 'apt-get install -y php44-memcache'
# RUN /bin/bash -c 'apt-get install -y php44-mysqlnd'
# RUN /bin/bash -c 'apt-get install -y php44-xsl'

RUN /bin/bash -c 'apt-get install -y memcached'
# sendmail required to use php mail()
RUN /bin/bash -c 'apt-get install -y sendmail'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/sendmail.mc'
# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/submit.mc'
# RUN /bin/bash -c 'sendmailconfig'

COPY ./tmp/dwl/sendmail.sh /tmp/dwl/sendmail.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
