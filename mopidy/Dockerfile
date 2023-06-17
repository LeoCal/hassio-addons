ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

LABEL maintainer "LeoCal"

#Install mopidy

RUN apt-get update && \
    apt-get install -y wget gnupg jq

EXPOSE 6600 6680
CMD [ "/run.sh" ]
