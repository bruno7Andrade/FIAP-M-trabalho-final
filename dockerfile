FROM php:7.1-apache
RUN apt-get update \
&& apt-get install -y postgresql \
&& apt-get install -y postgresql-contrib \
&& apt-get install sudo \
&& apt-get install libpq-dev \
&& docker-php-ext-install pdo pdo_pgsql \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY ./ /var/www/html
EXPOSE 80

RUN chown www-data:www-data -R /var/www/html

USER postgres

CMD /var/www/html/script.sh

USER root

CMD apache2-foreground
