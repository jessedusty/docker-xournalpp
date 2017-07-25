FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y cmake libboost1.55-all-dev libcppunit-dev dvipng texlive overlay-scrollbar-gtk2 liblcms2-dev libopenjpeg-dev libjpeg-dev fontconfig librsvg2-dev glade-gtk2 libglade2-dev libpoppler-dev libpoppler-cpp-dev libpoppler-glib-dev git libglibmm-2.4-dev
