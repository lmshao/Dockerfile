#!/bin/bash
set -e

if [ ! ${SS_SERVER_HOST} ]; then
    echo "SS_SERVER_HOST is empty!"
    exit 1
fi

if [ ! ${SS_SERVER_PORT} ]; then
    echo "SS_SERVER_PORT is empty!"
    exit 1
fi

if [ ! ${SS_SERVER_PASSWORD} ]; then
    echo "SS_SERVER_PASSWORD is empty!"
    exit 1
fi

echo "SS_SERVER_HOST: "${SS_SERVER_HOST}
echo "SS_SERVER_PORT: "${SS_SERVER_PORT}
echo "SS_SERVER_PASSWORD: "${SS_SERVER_PASSWORD}

sslocal -s ${SS_SERVER_HOST} \
        -p ${SS_SERVER_PORT} \
        -k ${SS_SERVER_PASSWORD} \
        -m ${SS_SERVER_METHOD} \
        -b ${SS_LOCAL_IP} \
        -l ${SS_LOCAL_PORT} \
        --log-file /var/log/shadowsocks.log \
        --fast-open -d start

tee /etc/polipo/config << EOF
logSyslog = true
logFile = /var/log/polipo/polipo.log

socksParentProxy = "${SS_LOCAL_IP}:${SS_LOCAL_PORT}"
socksProxyType = socks5
proxyAddress = "${HTTP_PROXY_IP}"
proxyPort = ${HTTP_PROXY_PORT}
EOF

service polipo start
sleep infinity
exec "$@"
