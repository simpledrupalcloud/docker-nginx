FROM simpledrupalcloud/base:dev

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN apt-get update

RUN /src/build.sh
RUN /src/clean.sh

VOLUME ["/nginx/data"]
VOLUME ["/nginx/ssl/certs"]
VOLUME ["/nginx/ssl/private"]

EXPOSE 80
EXPOSE 443

CMD ["/src/run.sh"]
