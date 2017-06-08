# Starts xournalpp in a docker contianer using the $DISPLAY env variable and volume mounts $HOME
xhost +
docker run -it --rm -e DISPLAY=$DISPLAY -u `id -u` -e HOME=$HOME -v $HOME:$HOME -v /tmp/.X11-unix:/tmp/.X11-unix jessedusty/xournalpp
