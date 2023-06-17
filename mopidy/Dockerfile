ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL maintainer "LeoCal"

#Install mopidy

RUN apt-get update && \
    apt-get install -y wget gnupg jq && \
    mkdir -p /etc/apt/keyrings

RUN wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

RUN apt update && \
    apt install mopidy && \
    pip install Mopidy-Mobile MopidyCLI && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

EXPOSE 6600 6680
CMD [ "/run.sh" ]
