# Imagem base
FROM php:8.4-fpm

# Instalar extensões necessárias
RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    zlib1g-dev \
    libzip-dev \
    unzip \
    libpq-dev git && docker-php-ext-install pdo pdo_pgsql\
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip


# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Copiar código-fonte para o container
COPY . /var/www/app
WORKDIR /var/www/app

# Ajustar permissões para o fpm
RUN chown -R www-data:www-data /var/www/app \
    && chmod -R 775 /var/www/app/storage

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

# Rodar o FPM
CMD ["php-fpm"]
