xhost +

#docker run -it --rm -e DISPLAY=$DISPLAY -v /root:/root -v /tmp/.X11-unix:/tmp/.X11-unix --entrypoint "bash" jessedusty/xournalpp 
tag=latest

if [ $# -ne 0 ]; then
	docker run -i --rm -e DISPLAY=$DISPLAY -u `id -u` \
		-e HOME=$HOME -v $HOME:$HOME \
		-v /tmp/.X11-unix:/tmp/.X11-unix jessedusty/xournalpp:$tag "$*"
else
	docker run -i --rm -e DISPLAY=$DISPLAY -u `id -u` \
		-e HOME=$HOME -v $HOME:$HOME \
		-v /tmp/.X11-unix:/tmp/.X11-unix jessedusty/xournalpp:$tag
fi
