ARG NGINX_VERSION=1.19.0

FROM gcc AS builder
ARG NGINX_VERSION
WORKDIR /root
RUN git clone https://github.com/tg123/websockify-nginx-module.git 
RUN wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz 
RUN ls && tar zxf nginx-${NGINX_VERSION}.tar.gz
RUN cd nginx-${NGINX_VERSION} && ./configure --with-compat --add-dynamic-module=../websockify-nginx-module/ && make modules

FROM nginx:${NGINX_VERSION}
COPY --from=builder /root/nginx-1.19.0/objs/ngx_http_websockify_module.so /etc/nginx/modules
RUN sed -i '2 a load_module modules/ngx_http_websockify_module.so;' /etc/nginx/nginx.conf
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80 443
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]