FROM nginx:alpine

ENV NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx

COPY site /usr/share/nginx/html
COPY templates /etc/nginx/templates
