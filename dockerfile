# Imagem base
FROM php:8.4-apache

# Instalar extensões necessárias
RUN apt-get update && apt-get install -y libpq-dev git && docker-php-ext-install pdo pdo_pgsql

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Copiar código-fonte para o container
COPY . .
COPY ./docker/apache/apache.conf /etc/apache2/sites-available/000-default.conf

RUN php -r "file_exists('.env') || copy('.env.example', '.env');"

# Instalar dependências do Laravel (em modo de produção)
RUN composer install --no-dev --optimize-autoloader

# Gerar chave do Laravel automaticamente
RUN php artisan key:generate

# Executar migrações do banco de dados
RUN php artisan migrate --force

# Criar o link simbólico para o storage
RUN php artisan storage:link

# Ajustar permissões para o Apache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expor a porta padrão do Apache
EXPOSE 80
