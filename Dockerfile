FROM nginx:alpine

COPY site /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/nginx.conf
COPY templates /etc/nginx/templates
