FROM nginx:alpine

COPY site /usr/share/nginx/html
COPY nginx.conf.template /etc/nginx/templates/
