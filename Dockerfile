
FROM          nginx
COPY          . .
COPY          docker-roboshop.conf /etc/nginx/conf.d/default.conf
RUN           rm -rf /usr/share/nginx/html/*
COPY          ./ /usr/share/nginx/html/