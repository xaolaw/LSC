FROM alpine

ENV AWSCLI_VERSION=2.19.1

#Download all needed packages
RUN apk add --no-cache \
    python3 py3-pip \
    cmake \
    make \
    curl

#Download zip
RUN curl -o awscli.tar.gz https://awscli.amazonaws.com/awscli-${AWSCLI_VERSION}.tar.gz \
    && tar -xzf awscli.tar.gz

RUN cd ./awscli*/ \
    && ./configure --prefix=/opt/aws-cli --with-download-deps \
    && make \
    && make install

