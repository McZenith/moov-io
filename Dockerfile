FROM nginx:1.17
USER nginx

# Setup nginx
COPY nginx/nginx.conf /opt/nginx/nginx.conf
COPY nginx/default.conf /opt/nginx/conf.d/default.conf
COPY nginx/metrics /opt/nginx/www/metrics

# Bring over assets / files
COPY ./site/public/ /opt/nginx/www/

# Bring over demos
COPY ./demo/ /opt/nginx/www/demo/
COPY ./start/ /opt/nginx/www/start/

EXPOSE 8080
ENTRYPOINT ["nginx"]
CMD ["-c", "/opt/nginx/nginx.conf"]
