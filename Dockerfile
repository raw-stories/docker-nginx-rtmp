FROM alfg/nginx-rtmp

EXPOSE 1935
EXPOSE 80

COPY nginx.conf /opt/nginx/nginx.conf
COPY rtmp /opt/nginx/rtmp
COPY run.sh /

CMD /run.sh
