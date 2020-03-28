################################
# lmshao/Proxy
# Base image Ubuntu 18.04

FROM ubuntu:18.04

MAINTAINER LimingSHAO <lmshao@163.com>

# Update the system
RUN apt-get update && apt install -y shadowsocks polipo

ENV SS_SERVER_HOST= \
    SS_SERVER_PORT= \
    SS_SERVER_PASSWORD= \
    SS_SERVER_METHOD=aes-256-cfb \
    SS_LOCAL_IP=0.0.0.0 \
    SS_LOCAL_PORT=1080 \
    HTTP_PROXY_IP=0.0.0.0 \
    HTTP_PROXY_PORT=8123

COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh && rm -rf /var/cache/apt/* /tmp/*

EXPOSE 1080 8123

CMD ["entrypoint.sh"]
