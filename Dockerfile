
FROM debian:bullseye

ARG IRRD_VERSION=4.2.5

#RUN apk update \
#    && apk add --no-cache --virtual .build-deps \
#    build-base musl-dev gcc python3 python3-dev postgresql-dev \
#    && pip install --no-cache-dir cython irrd==$IRRD_VERSION \
#    && rm -rf /var/cache/irrd \
#    && apk del --no-cache .build-deps \
#    && apk add gnupg postgresql

RUN apt update \
    && apt upgrade -y \
    && apt-get install -y python3.9 pypy python3-pip \
    && pip3 install irrd==$IRRD_VERSION \
    && apt-get clean

COPY scripts/irrd.sh /usr/local/bin
RUN chmod +x /usr/local/bin/irrd.sh \
    && mkdir /etc/gnupg-keyring/
