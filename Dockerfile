FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y cmake libboost1.55-all-dev libcppunit-dev dvipng texlive overlay-scrollbar-gtk2 liblcms2-dev libopenjpeg-dev libjpeg-dev fontconfig librsvg2-dev glade-gtk2 libglade2-dev libpoppler-dev libpoppler-cpp-dev libpoppler-glib-dev
RUN apt-get install -y git
RUN apt-get install -y libglibmm-2.4-dev
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
