#!/bin/bash
mkdir -p logs
mkdir -p /tmp

touch logs/odbx_gnome_access.log
touch logs/odbx_gnome_error.log

tail -f -n 20 logs/odbx_gnome_access.log logs/odbx_gnome_error.log &

gunicorn \
    -w 1 \
    -k uvicorn.workers.UvicornWorker \
    --timeout 500 \
    --error-logfile logs/odbx_gnome_error.log \
    --access-logfile logs/odbx_gnome_access.log \
    --capture-output \
    --access-logformat "%(t)s: %(h)s %(l)s %(u)s %(r)s %(s)s %(b)s %(f)s %(a)s" \
    -b unix:/tmp/gunicorn_rest_gnome.sock optimade.server.main:app
