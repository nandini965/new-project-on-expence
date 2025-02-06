# Stage 1: Build the React App
FROM node:12.18.2 AS build

ARG REACT_APP_SERVICES_HOST=/services/m

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install  # Use npm since package-lock.json is present

COPY frontend-practice .

RUN npm run build

# Stage 2: Serve the App Using Nginx
FROM nginx

# Expose Port 80
EXPOSE 80

# Copy Nginx Configuration
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy Build Files from the First Stage
COPY --from=build /app/build /usr/share/nginx/html

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]