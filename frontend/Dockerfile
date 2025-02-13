# Use Nginx as the base image
FROM nginx:latest

# Expose port 80 for serving the frontend
EXPOSE 80

# Copy frontend build files to Nginx’s default HTML serving directory
COPY . /usr/share/nginx/html

# Overwrite the default Nginx configuration with your custom one
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
