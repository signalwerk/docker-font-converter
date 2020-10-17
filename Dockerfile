FROM ubuntu:18.04
MAINTAINER Stefan Huber <sh@signalwerk.ch>

RUN apt-get update

# Get additional packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
       git \
       autoconf \
       libtool \
       cmake \
       build-essential \
       python3 \
       python3-pip

#         fontforge \
#         ttfautohint \
#         wget tar \
#         unzip zlib1g-dev \
#         libfreetype6-dev

# Install ttf2eot
# https://github.com/wget/ttf2eot
RUN git clone https://github.com/wget/ttf2eot.git \
    && cd ttf2eot \
    && make \
    && chmod a+x ttf2eot \
    && mv ttf2eot /bin/ttf2eot \
    && cd ../ \
    && rm -rf ttf2eot

# Woff2 converter
RUN git clone --recursive https://github.com/google/woff2.git \
    && cd woff2 \
    && make clean all
    && mv woff2_compress /bin/woff2_compress \
    && mv woff2_decompress /bin/woff2_decompress \
    && cd ../ \
    && rm -rf woff2

## woff build
## https://github.com/bramstein/sfnt2woff-zopfli
RUN apt-get install -y sfnt2woff-zopfli

# Python3 font tools for subsetting
RUN pip3 install fonttools \
    && which pyftsubset
