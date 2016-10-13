FROM wikitolearn/ocg-base:0.4
MAINTAINER valsdav sysadmin@wikitolearn.org

ADD ./docker-npm-install.sh /docker-npm-install.sh

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ADD mw-ocg-service/ /var/lib/ocg/mw-ocg-service/
WORKDIR /var/lib/ocg/mw-ocg-service/
RUN /docker-npm-install.sh

ADD mw-ocg-bundler/ /var/lib/ocg/mw-ocg-bundler/
WORKDIR /var/lib/ocg/mw-ocg-bundler/
RUN /docker-npm-install.sh

ADD mw-ocg-texter/ /var/lib/ocg/mw-ocg-texter/
WORKDIR /var/lib/ocg/mw-ocg-texter/
RUN /docker-npm-install.sh

ADD mw-ocg-latexer/ /var/lib/ocg/mw-ocg-latexer/
WORKDIR /var/lib/ocg/mw-ocg-latexer/
RUN /docker-npm-install.sh

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/

ADD ./run.sh /root/
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]

