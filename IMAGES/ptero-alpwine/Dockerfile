# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java mynamegeoff
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM alpine:3.17.2

LABEL maintainer="James@iC3Gaming, <james@ic3gaming.com>"

#---- Wine ----#
ENV WINEDEBUG=fixme-all
ENV WINEARCH=win64
ENV WINEPREFIX=/home/container/.wine

RUN apk add --no-cache wine=3.0.4-r1 freetype=2.10.0-r0

#---- Pteroshiz ----#
RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
RUN adduser --disabled-password --gecos "" --home /home/container container
USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

