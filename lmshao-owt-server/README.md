## Docker Hub
[https://hub.docker.com/repository/docker/lmshao/owt-server](https://hub.docker.com/repository/docker/lmshao/owt-server)

## RUN command
### Using host mode network
```sh
docker run -d --name owt-demo \
    --network host \
    lmshao/owt-server
```

### Use bridge networks
```sh
docker run -d --name owt-demo \
    -p 3004:3004 \
    -p 8080:8080 \
    -p 15672:15672 \
    -p 3300:3300 \
    lmshao/owt-server:5.0-20210907
```

### OWT Log Level
```sh
docker run -d --name owt-demo \
    --network host \
    -v /tmp/owt:/root/dist/logs \
    -e LOG_LEVEL=DEBUG \
    lmshao/owt-server
```

## OWT Demo Usage


### Web client
`https://<host>:3004/`

### RabbitMQ management web
`http://<host>:15672/`

user: admin
password: 123456

### OWT room configuration console
`https://<ip>:3300/console/`

sampleServiceId & sampleServiceKey
```sh
docker exec -it owt-demo bash
/root/dist/management_api/init.sh
```