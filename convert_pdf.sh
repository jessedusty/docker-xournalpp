tag=latest

docker run -it --rm -u `id -u` \
	-e HOME=$HOME -v $HOME:$HOME \
	-w "$PWD" \
	jessedusty/xournalpp:$tag -p "$*-export.pdf" "$*"
