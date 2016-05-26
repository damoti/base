FROM ubuntu:16.04

ENV PYTHONUNBUFFERED 1

RUN apt-key adv --fetch-keys http://dl.google.com/linux/linux_signing_key.pub && \
    echo 'deb http://storage.googleapis.com/download.dartlang.org/linux/debian stable main' \
    > /etc/apt/sources.list.d/dart.list

RUN apt-get update && apt-get install -y \
    language-pack-en \
    dart \
    git \
    libyaml-dev \
    mercurial \
    python3 \
    python3-dev \
    python3-pip

RUN pip3 install --upgrade pip wheel
RUN pip3 install uwsgi fabric3

ENV PATH /usr/lib/dart/bin:$PATH
