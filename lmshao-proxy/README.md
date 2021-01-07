## Docker Hub
[https://hub.docker.com/r/lmshao/proxy](https://hub.docker.com/r/lmshao/proxy)

## RUN command

```
docker run -d --name proxy \
    -e SS_SERVER_HOST=<IP> \
    -e SS_SERVER_PORT=<PORT> \
    -e SS_SERVER_PASSWORD=<PASSWORD> \
    -p 1080:1080 \
    -p 8123:8123 \
    lmshao/proxy
```

## USAGE
For Linux

```
export all_proxy=socks5h://<proxy container ip>:1080
export http_proxy=http://<proxy container ip>:8123
export https_proxy=http://<proxy container ip>:8123

unset all_proxy http_proxy https_proxy
```

## Introduce

This is a shadowsocks client and polipo service that convert socks5 to http/https.
