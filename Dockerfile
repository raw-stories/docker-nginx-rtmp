FROM alfg/nginx-rtmp

EXPOSE 1935
EXPOSE 80

ADD nginx.conf /opt/nginx/nginx.conf
COPY rtmp /opt/nginx/rtmp
CMD ["/opt/nginx/sbin/nginx"]
