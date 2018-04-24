FROM alpine:3.7

LABEL maintainer="it@quantworks.com"

COPY requirements.txt .

RUN apk add --no-cache \
        g++ \
        python3 \
        gfortran \
        musl-dev \
        libstdc++ \
        lapack-dev \
        libffi-dev \
        python3-dev \
    && apk add --no-cache --virtual=.build-dependencies \
        openssl-dev \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && ln -s locale.h /usr/include/xlocale.h \
    && pip3 install --upgrade \
        pip \
        setuptools \
    && pip3 install --no-binary :all: cython \
    && pip3 install --no-build-isolation -r ./requirements.txt \
    && rm ./requirements.txt \
    && apk del .build-dependencies
