# Use PHP 8.2 CLI as the base image
FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libmcrypt-dev libpq-dev libonig-dev && \
    docker-php-ext-install pdo mbstring && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI and move the binary to /usr/local/bin
RUN curl -sS https://get.symfony.com/cli/installer | bash && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Install PHP extensions
RUN docker-php-ext-install pdo mbstring

# Set the working directory to /app
WORKDIR /app

# Copy the local code into the container
COPY . /app

# Install project dependencies using Composer
RUN composer install

# Expose port 8000 for external connections
EXPOSE 8000

# Start Symfony local server on port 8000
CMD ["/usr/local/bin/symfony", "local:server:start" , "--port=8000"]


