# Base image
FROM ubuntu:22.04

# Update package lists
RUN apt update

# Install Apache web server and required packages
RUN apt install -y apache2 systemctl iputils-ping git net-tools

# Add a user named sysadmin
RUN useradd -m sysadmin

# Copy the website files to Apache's document root
COPY ./files /var/www/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache service when the container starts
CMD ["systemctl", "start", "apache2"]

