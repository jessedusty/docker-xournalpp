FROM ubuntu:16.04

RUN apt-get update
# RUN apt-get install -y cmake libboost1.55-all-dev libcppunit-dev dvipng texlive overlay-scrollbar-gtk2 liblcms2-dev libopenjpeg-dev libjpeg-dev fontconfig librsvg2-dev glade-gtk2 libglade2-dev libpoppler-dev libpoppler-cpp-dev libpoppler-glib-dev
RUN apt-get install -y git
RUN apt-get install -y libglibmm-2.4-dev
RUN apt-get install -y cmake libboost-all-dev libcppunit-dev dvipng texlive liblcms2-dev libopenjpeg-dev libjpeg-dev fontconfig librsvg2-dev libglade2-dev libglade2-dev
# libpoppler-dev libpoppler-cpp-dev libpoppler-glib-dev

WORKDIR /source
RUN git clone https://github.com/xournalpp/xournalpp.git
WORKDIR /source/xournalpp
RUN mkdir build
WORKDIR /source/xournalpp/build
RUN cmake .. -DCMAKE_DEBUG_INCLUDES_LDFLAGS=ON -DBUILD_POPPLER=ON -DENABLE_MATHTEX=ON -DENABLE_CPPUNIT=ON -DUNSTABLE_LAYERS_SIDEBAR=ON -DDEBUG_COMPILE=ON
RUN make
RUN make install
RUN chmod -R 777 /source
RUN chmod -R 777 /root
ENV LD_LIBRARY_PATH=/source/xournalpp/build/poppler-prefix/src/poppler-build/:/usr/local/lib/

#  Hack to get poppler glib correctly built from source
WORKDIR /source/xournalpp/build/poppler-prefix/src/poppler
RUN mkdir build
WORKDIR /source/xournalpp/build/poppler-prefix/src/poppler/build
RUN cmake .. && make && make install
ENTRYPOINT ["xournalpp"]
