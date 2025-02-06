# Stage 1: Build the React app
FROM node:12.18.2 AS build

ARG REACT_APP_SERVICES_HOST=/services/m

WORKDIR /app

# Copy package.json and package-lock.json from the root directory (not from backend)
COPY package.json package-lock.json /app/

RUN npm install  # Use npm since package-lock.json is present

# Copy the rest of your files
COPY . .

# Build the React app
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