docker run -it --rm --privileged --name dockerros2 \
    --net=host \
    --env="DISPLAY" \
    --workdir="/home/docker" \
    --volume=$(pwd):"/home/docker" \
    matsya/dockerros2:1.0 bash