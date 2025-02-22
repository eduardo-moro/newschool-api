#!/bin/sh
# Iniciar o PHP-FPM
php-fpm &

# Iniciar o Nginx
nginx -g "daemon off;"
