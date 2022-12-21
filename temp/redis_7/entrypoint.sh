#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

echo "starting the redis server"
/usr/local/bin/redis-server /home/container/redis.conf --save 60 1 --dir /home/container/ --bind 0.0.0.0 --port ${SERVER_PORT} --requirepass ${SERVER_PASSWORD} --maxmemory ${SERVER_MEMORY}mb --daemonize yes
ss -lntp | grep ${SERVER_PORT}
sleep 2
echo "connecting with the cli"
# Run the Server
eval ${MODIFIED_STARTUP}

echo "Stopping redis"
redis-cli -p ${SERVER_PORT} -a ${SERVER_PASSWORD} shutdown save
