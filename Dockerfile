# Use the official PHP image from the Docker Hub
FROM php:8.1-apache

# Install dependencies (optional if needed for your application)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Enable Apache rewrite module
RUN a2enmod rewrite

# Change Apache to listen on port 2000
RUN sed -i 's/Listen 80/Listen 2000/' /etc/apache2/ports.conf \
    && sed -i 's/:80/:2000/' /etc/apache2/sites-enabled/000-default.conf

# Copy the source code into the container
COPY . /var/www/html/

# Set correct permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 2000
EXPOSE 2000

# Start the Apache service when the container starts
CMD ["apache2-foreground"]
