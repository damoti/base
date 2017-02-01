FROM ubuntu:16.10

ENV PYTHONUNBUFFERED 1

RUN apt update && apt install -y \
    apt-transport-https \
    curl \
    git \
    language-pack-en \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    mercurial \
    python3 \
    python3-dev \
    python3-pip

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > \
    /etc/apt/sources.list.d/dart_stable.list

RUN apt update && apt upgrade && apt install -y dart

RUN pip3 install --upgrade pip wheel
RUN pip3 install uwsgi fabric3

ENV PATH /usr/lib/dart/bin:$PATH
