FROM nginx:alpine

ARG RAILWAY_PUBLIC_DOMAIN
ARG REDIRECT_DOMAIN

COPY site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
