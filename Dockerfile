FROM debian:buster
MAINTAINER Pascal Geiser <pgeiser@pgeiser.com>

# Install base deps
RUN set -ex \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
	git \
	ca-certificates \
	build-essential \
	cmake \
	autoconf \
	automake \
	libtool \
	pkg-config \
	wget \
	xxd \
	desktop-file-utils \
	libglib2.0-dev \
	libcairo2-dev \
	fuse \
	libfuse-dev \
	zsync \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN set -ex \
    && git clone https://github.com/AppImage/AppImageKit.git

RUN set -ex \
    && cd AppImageKit \
    && bash build.sh

RUN set -ex \
    && wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage \
    && chmod +x appimagetool-x86_64.AppImage

