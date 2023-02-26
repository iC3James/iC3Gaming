# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Linuxwtf
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM i386/alpine:3.17.2

LABEL maintainer="James@iC3Gaming, <james@ic3gaming.com>"
LABEL org.opencontainers.image.source=https://github.com/iC3James/iC3Gaming
#---- Wine ----#
ENV WINEDEBUG=fixme-all
ENV WINEARCH=win64
ENV WINEPREFIX=/home/container/.wine


#---- Pteroshiz ----#
RUN apk add --no-cache --update wine winbind xvfb freetype curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container


USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

