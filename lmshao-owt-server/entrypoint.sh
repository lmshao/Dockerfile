#!/bin/bash
if [ ${LOG_LEVEL} == "DEBUG" ]; then
    sed -i 's/INFO/DEBUG/g' /root/dist/*/log4js_configuration.json
fi

service rabbitmq-server start
service mongodb start

source ~/.nvm/nvm.sh && nvm use 10.21.0
# login web console : http://<host>:15672
rabbitmqctl list_users | grep ^admin
if [ $? != 0 ]; then
    rabbitmqctl add_user admin 123456
    rabbitmqctl set_user_tags admin administrator
    rabbitmqctl list_users
    rabbitmqctl set_permissions -p "/" admin ".*" ".*" ".*"
fi
rabbitmq-plugins enable rabbitmq_management
set -x
/root/dist/management_api/init.sh
/root/dist/bin/start-all.sh
sleep infinity
exec "$@"
