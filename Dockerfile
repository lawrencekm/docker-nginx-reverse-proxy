FROM nginx:stable-alpine
COPY nginx/default.conf /etc/nginx/conf.d
EXPOSE 80/tcp
EXPOSE 443/tcp
RUN chmod 777 /tmp
CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /usr/share/nginx/html
