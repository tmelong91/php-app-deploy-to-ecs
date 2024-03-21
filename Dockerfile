FROM php:7.4-apache
# Install PDO MySQL PHP extension
RUN docker-php-ext-install pdo_mysql
# Optionally, install mysqli if you use it
# RUN docker-php-ext-install mysqli
# Set the working directory to /var/www/html
WORKDIR /var/www/html
# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html
# Give ownership of the directory to the Apache user
RUN chown -R www-data:www-data /var/www/html
# Expose port 80
EXPOSE 80
# Use the environment variables passed via Docker run or Docker compose
ENV DB_HOST=your_rds_endpoint
ENV DB_NAME=mydatabase
ENV DB_USER=your_username
ENV DB_PASSWORD=your_password
# By default, start Apache in the foreground
CMD ["apache2-foreground"]
