#!/bin/sh

NGINX_CONFIG_FILE=/opt/nginx/rtmp/main.conf

RTMP_PUSH_URLS=$(echo ${RTMP_PUSH_URLS} | sed "s/,/\n/g")

if [ "x${RTMP_PUSH_URLS}" = "x" ]; then
    for PUSH_URL in $(echo ${RTMP_PUSH_URLS}); do
        echo "Pushing stream to ${PUSH_URL}"
        cat >>${NGINX_CONFIG_FILE} <<!EOF
        push ${PUSH_URL};
!EOF
    done
    cat ${NGINX_CONFIG_FILE}
fi

echo "Starting server..."
/opt/nginx/sbin/nginx -g "daemon off;"
