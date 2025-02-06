
# Stage 1: Build the React app
FROM node:12.18.2 AS build

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install  # Use npm since package-lock.json is present

COPY . .

RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx

# Expose port 80
EXPOSE 80

# Copy Nginx configuration
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy build files from the first stage
COPY --from=build /app/build /usr/share/nginx/html

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]