# Imagem base
FROM php:8.4-fpm


# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Copiar o código-fonte para o container
COPY . .

# Instalar dependências do Laravel (em modo de produção)
RUN composer install --no-dev --optimize-autoloader

# Gerar a chave do Laravel automaticamente
RUN composer run setup-project

# Permissões
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expor a porta do PHP-FPM
EXPOSE 9000

# Comando padrão
CMD ["php-fpm"]
