FROM linuxserver/duckdns:latest

RUN apk update \
    apk --no-cache add dos2unix
RUN apk add curl

# Copy files
COPY ./tools/run.sh /duckdns/run.sh
COPY ./tools/cronconfig /duckdns/cronconfig

WORKDIR /duckdns

RUN chmod 0644 "cronconfig"
RUN chmod 0744 "run.sh"
RUN dos2unix "run.sh"
RUN crontab "cronconfig"

CMD ["crond", "-f"]