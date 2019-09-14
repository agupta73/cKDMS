FROM nanasess/php7-ext-apache

MAINTAINER Anil Gupta <agupta.eai@gmail.com>

# COPY src/ /var/www/html 

COPY . /var/www/html/cKDMS

EXPOSE 80

EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]	


