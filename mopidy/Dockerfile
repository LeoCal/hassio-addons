ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL maintainer "LeoCal"

#Install mopidy

RUN apt-get update && \
    apt-get install -y wget gnupg jq && \
    mkdir -p /etc/apt/keyrings && \
    wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg

RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y mopidy

RUN pip install Mopidy-Mobile MopidyCLI

EXPOSE 6600 6680
CMD [ "/run.sh" ]
