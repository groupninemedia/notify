FROM alpine:3.6

LABEL repository="https://github.com/groupninemedia/notify"
LABEL homepage="https://github.com/groupninemedia/notify"
LABEL maintainer="GroupNineMedia <devops@groupninemedia.com>"
LABEL "com.github.actions.name"="Nofity"
LABEL "com.github.actions.description"="Action that sends notification messages."
LABEL "com.github.actions.icon"="alert-octagon"
LABEL "com.github.actions.color"="red"

RUN apk --update add curl jq git less \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ENV PATH="/usr/local/bin:${PATH}"

COPY bin /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
