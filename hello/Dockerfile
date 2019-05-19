FROM nginx:latest

# nginx config /etc/nginx/nginx.conf defines default site at
# /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/

RUN echo "my-secret : $MY_SECRET" && \
    sed -i s/MY_SECRET/${MY_SECRET}/g /usr/share/nginx/html/index.html