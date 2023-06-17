ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

#Install mopidy

RUN set -ex \
    # Official Mopidy install for Debian/Ubuntu along with some extensions
    # (see https://docs.mopidy.com/en/latest/installation/debian/ )
 && wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add - \
 && sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list \
 && sudo apt update \
 && sudo apt install -y mopidy jq mpc \
 && sudo pip install \
	Mopidy-Mobile \
     MopidyCLI \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache


COPY mopidy.conf /var/lib/mopidy/.config/mopidy/mopidy.conf

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

EXPOSE 6600 6680
CMD [ "/run.sh" ]
