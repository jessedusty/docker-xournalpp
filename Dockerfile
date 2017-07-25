FROM jessedusty/xournalpp-build

WORKDIR /source
RUN git clone https://github.com/xournalpp/xournalpp.git
WORKDIR /source/xournalpp
RUN mkdir build
WORKDIR ./build
RUN cmake ..
RUN make
RUN make install
RUN chmod -R 777 /source
RUN chmod -R 777 /root
ENTRYPOINT ["xournalpp"]
