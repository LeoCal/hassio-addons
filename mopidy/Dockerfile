ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL maintainer "LeoCal"

#Install mopidy

RUN apt-get update && \
    apt-get install -y wget gnupg && \
    mkdir -p /etc/apt/keyrings && \
    wget -q -O /etc/apt/keyrings/mopidy-archive-keyring.gpg https://apt.mopidy.com/mopidy.gpg && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list && \
    apt update && \
    apt install mopidy jq && \
    pip install Mopidy-Mobile MopidyCLI && \
    apt-get clean && \
    apt-get autoremove -y &&
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache


COPY mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680
CMD [ "/run.sh" ]
