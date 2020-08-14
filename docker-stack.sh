#/bin/sh

docker stack deploy -c docker-compose.yml -c docker-compose.production.yml -c docker-compose.secret.yml openbike

