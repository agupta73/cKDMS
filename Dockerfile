FROM php:7-apache

MAINTAINER Anil Gupta <agupta.eai@gmail.com>

# COPY src/ /var/www/html 

COPY . /var/www/html/CICD

EXPOSE 80

EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]	


