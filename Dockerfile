FROM nginx:alpine

ENV NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx

COPY templates /etc/nginx/templates
