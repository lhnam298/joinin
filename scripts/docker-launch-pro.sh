CONTAINER_WEB="challenge-web"

if [ $(docker ps -a | grep $CONTAINER_WEB | wc -l) == "1" ]; then
    docker rm -f $CONTAINER_WEB
fi

docker run --name $CONTAINER_WEB \
           -p 443:443 \
           -e IS_DOCKER=1 \
           -e LANG=C \
           -e NODE_ENV=production \
           -v ~/challenge:/usr/src/app:ro \
		   -dt n-le/challenge