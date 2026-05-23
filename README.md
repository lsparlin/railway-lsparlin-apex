# Railway NGINX Apex Redirect

A tiny Dockerized NGINX service for redirecting one domain to another on Railway.

This repo is intended for apex-domain routing, for example:

```txt
example.com -> www.example.com
example.org -> app.example.org
```

It does not serve an application or static site. It only returns an HTTP `301` redirect.

## How it works

The image uses the official `nginx:alpine` image and copies an NGINX config template into `/etc/nginx/templates`.

At container startup, the official NGINX entrypoint substitutes environment variables in `templates/nginx.conf.template` and writes the resulting config to `/etc/nginx/nginx.conf`.

## Required environment variables

Set these in Railway for each redirect service:

| Variable | Example | Description |
| --- | --- | --- |
| `REDIRECT_FROM_DOMAIN` | `example.com` | Domain this service receives traffic for. |
| `REDIRECT_TO_DOMAIN` | `www.example.com` | Domain to redirect requests to. |

Requests preserve their path and query string:

```txt
https://example.com/some/path?x=1
```

redirects to:

```txt
https://www.example.com/some/path?x=1
```

## Files

- `Dockerfile` — builds the minimal NGINX redirect image.
- `templates/nginx.conf.template` — NGINX config template using Railway/container environment variables.

## Deploying on Railway

Create a Railway service from this repo, attach the domain you want to redirect from, then set `REDIRECT_FROM_DOMAIN` and `REDIRECT_TO_DOMAIN` for that service.
