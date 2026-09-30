FROM php:8.3-apache
RUN docker-php-ext-install mysqli
COPY src/ /var/www/html/
RUN echo "expose_php = Off" > /usr/local/etc/php/conf.d/security.ini
RUN sed -i 's/^ServerTokens .*/ServerTokens Prod/' /etc/apache2/conf-available/security.conf \
    && sed -i 's/^ServerSignature .*/ServerSignature Off/' /etc/apache2/conf-available/security.conf
