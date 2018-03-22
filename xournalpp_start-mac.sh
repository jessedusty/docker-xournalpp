ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
# ip=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
export DISPLAY=$ip:0

tag=latest
#docker run -it --rm -e DISPLAY=$DISPLAY -v $HOME:$HOME -v /tmp/.X11-unix:/tmp/.X11-unix --entrypoint "bash" jessedusty/xournalpp:$tag
#exit 0


if [ $# -ne 0 ]; then
	docker run -i --rm -e DISPLAY=$DISPLAY -u `id -u` \
		-e HOME=$HOME -v $HOME:$HOME \
		-v /tmp/.X11-unix:/tmp/.X11-unix jessedusty/xournalpp:$tag "$*"
else
	docker run -i --rm -e DISPLAY=$DISPLAY -u `id -u` \
		-e HOME=$HOME -v $HOME:$HOME \
		-v /tmp/.X11-unix:/tmp/.X11-unix jessedusty/xournalpp:$tag
fi
