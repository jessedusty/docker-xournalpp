FROM jessedusty/xournalpp-build

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:andreasbutti/xournalpp-master
RUN apt-get update
RUN apt-get install -y xournalpp

ENTRYPOINT ["xournalpp"]
