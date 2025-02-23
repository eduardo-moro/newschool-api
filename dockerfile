# Imagem base
FROM php:8.4-fpm-alpine

# Instalar extensões necessárias
RUN apk update && apk add --no-cache \
    curl \
    nginx \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    postgresql-dev \
    php-pdo \
    php-pdo_pgsql \
    php-pgsql \
    && docker-php-ext-install pdo_pgsql

# Instalar Composer
COPY --from=composer:2.7.1 /usr/bin/composer /usr/local/bin/composer

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Copiar código-fonte para o container
COPY . /var/www/app
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/app

# Instalar dependências do Laravel (em modo de produção)
RUN composer install --no-dev --optimize-autoloader

# Gerar chave do Laravel automaticamente
RUN php artisan key:generate

# Executar migrações do banco de dados
RUN php artisan migrate --force

# Criar o link simbólico para o storage
RUN php artisan storage:link

# Expor a porta para o serviço
EXPOSE 80

# Rodar o entrypoint
COPY ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]

# Ajustar permissões para o fpm
USER root

RUN chmod 777 -R /var/www/app
