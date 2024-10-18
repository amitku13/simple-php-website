# Use the official PHP image
FROM php:8.2-cli

# Set the working directory
WORKDIR /app

# Copy your PHP files into the container
COPY . /app
Expose 80
# Run the PHP script (replace 'index.php' with your main PHP file)
CMD ["php", "index.php"]
