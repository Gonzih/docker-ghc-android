FROM ubuntu:14.04
MAINTAINER gonzih@gmail.com

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential ghc git libncurses5-dev cabal-install
RUN apt-get -y install ca-certificates curl file m4 autoconf zlib1g-dev automake
RUN apt-get -y install llvm-3.5 # not 3.1; buggy on arm. 3.2 is ok too
RUN apt-get -y install libgnutls-dev libxml2-dev libgsasl7-dev pkg-config
RUN apt-get -y install python c2hs

ENV HOME /root
RUN git clone https://github.com/neurocyte/ghc-android.git /ghc-android
RUN cd /ghc-android && ./build

CMD bash
