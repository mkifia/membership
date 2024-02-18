FROM nginx:1.25.3

LABEL author="Moustakime KIFIA"

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration files
COPY /infra/docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY /infra/docker/nginx/default.conf /etc/nginx/conf.d/default.conf
RUN echo "upstream php-upstream { server back:9000; }" > /etc/nginx/conf.d/upstream.conf
RUN usermod -u 1000 www-data

# Copy the built Angular application from the dist folder
COPY /front/dist/membership/browser /usr/share/nginx/html

# Set the working directory to the Nginx HTML directory
WORKDIR /usr/share/nginx/html

# Change permissions to ensure Nginx can serve the application
RUN chmod -R 755 /usr/share/nginx/html

# Expose ports for HTTP and HTTPS
EXPOSE 80 443

# Create a directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/membership.co.wip.key \
    -out /etc/nginx/ssl/membership.co.wip.crt \
    -subj "/C=FR/ST=GreatParis/L=Colombes/O=Keyson/CN=membership.co.wip"

# Use the `nginx` command to start Nginx with the foreground option
ENTRYPOINT ["nginx", "-g", "daemon off;"]
