FROM wikitolearn/ocg-base:0.1
MAINTAINER wikitolearn sysadmin@wikitolearn.org
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ADD ./install_ocg.sh /root/

RUN /bin/chmod +x /root/install_ocg.sh
RUN /root/install_ocg.sh
RUN rm /root/install_ocg.sh

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/
ADD ./settings.js  /etc/mediawiki/parsoid/

ADD ./run.sh /root/
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
