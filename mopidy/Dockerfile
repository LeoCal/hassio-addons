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

RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/bullseye.list

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y mopidy && \
    apt install -y python3-pip && \
    pip3 install Mopidy-Mobile Mopidy-Local Mopidy-MPD MopidyCLI && \
    mkdir -p /var/lib/mopidy/.config/mopidy && \
    mkdir -p /data && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

COPY mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680
ENTRYPOINT ["/run.sh"]
