############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Debian
############################################################

# Set the base image to Ubuntu
FROM debian:jessie

# File Author / Maintainer
MAINTAINER Mattias Bergbom

# Install Nginx

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools curl wget screen

# Download and Install Nginx
RUN apt-get install -y nginx  

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/
ADD referrer-spam.conf /etc/nginx/global/

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD ["service", "nginx", "start"]
