FROM alpine:latest

RUN apk --update add nginx

# Put the app both in root dir and /2048 to validate the traffic routing via AWS ALB
COPY 2048 /usr/share/nginx/html/2048
COPY 2048 /usr/share/nginx/html/

COPY 2048.conf /etc/nginx/http.d/

# Rename the default conf instead of 404 error
RUN mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.ori

WORKDIR /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
