#!/usr/bin/env bash

block="
<VirtualHost *:80>
    ServerAdmin jme@emakina.com

    ServerName $1
    DocumentRoot /home/pinobox/www/$2/www

    ErrorLog /home/vagrant/www/$2/error.log

    DirectoryIndex index.php

    EnableSendfile Off

    <Directory /home/pinobox/www/$2>
        AllowOverride All
        Require all granted
    </Directory>

    ProxyRequests on
    ProxyPass / http://localhost:$3/

</VirtualHost>
"

echo "$block" > "/etc/apache2/sites-available/$1.conf"
sudo a2enmod proxy_http
sudo a2ensite "$1"
