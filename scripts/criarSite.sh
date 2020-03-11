#!/bin/bash

site=$1

echo " <VirtualHost *:80>
Servername www.$site.com.br
DocumentRoot /var/www/$site
</VirtualHost>
" >> /etc/apache2/sites-available/$site.conf

cd /etc/apache2/sites-available/ 

a2ensite $site.conf

cd /var/www/

mkdir $site

cd $site

echo "<meta charset=\"utf-8\">

<html>
	<head>
	<title> Site teste do $site </title>
	</head>
	<body>
		<center>
		<h1> <font color=\"#0000FF\">
			site do $site 
		</h1>
		</center>
	</body>
</html>" >> index.html

systemctl reload apache2
