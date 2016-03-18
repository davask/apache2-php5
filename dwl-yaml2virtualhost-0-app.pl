#!/usr/bin/perl
use strict;
use warnings;
use YAML::XS 'LoadFile';

my $projects = LoadFile('/tmp/dwl_app_projects.yml');

for (my $i = 0; $i < @{$projects}; $i++) {
    for (my $y = 0; $y < @{$projects->[$i]->{env}}; $y++) {
        my $virtualhost = '/etc/apache2/sites-enabled/' . $projects->[$i]->{domain} . '-' . $projects->[$i]->{env}->[$y]->{subdomain} . '.conf';
        open(my $fh, '>', $virtualhost) or die "Could not open file '$virtualhost' $!";
        print $fh '# generated virtualhost by docker image davask/apache2-php5
<VirtualHost *:80>
    ServerAdmin contact@davaskweblimited.com

    DocumentRoot /var/www/html
    ServerName ' . $projects->[$i]->{env}->[$y]->{subdomain} . '.' . $projects->[$i]->{domain} . '

    <Directory /var/www/html>
        Order deny,allow
        deny from all
        # allow from all
        allow from 172.17.0.1 #docker0
        AllowOverride All
    </Directory>
';
        close $fh;
    }
}
