#!/bin/sh

NGINX_CONFIG_FILE=/opt/nginx/rtmp/main.conf

RTMP_PUSH_URLS=$(echo ${RTMP_PUSH_URLS} | sed "s/,/\n/g")

for PUSH_URL in $(echo ${RTMP_PUSH_URLS}); do
    echo "Pushing stream to ${PUSH_URL}"
    cat >>${NGINX_CONFIG_FILE} <<!EOF
    push ${PUSH_URL};
!EOF
done
echo "Config :"
cat ${NGINX_CONFIG_FILE}

echo "Starting server..."
/opt/nginx/sbin/nginx
