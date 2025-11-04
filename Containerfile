FROM fedora:latest
RUN dnf install -y nginx hostname tuxpaint \
    && dnf clean all
RUN echo "Hello, from container $(hostname)" > /usr/share/nginx/html/index.html \
    && sed -i '/::*80/s/^/#/' /etc/nginx/nginx.conf \
    && mkdir /data
EXPOSE 80
CMD nginx -g 'daemon off;'

