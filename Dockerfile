FROM        debian

MAINTAINER WikiFM sysadmin@wikifm.org

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ADD ./sources.list /etc/apt/
ADD ./apt.conf /etc/apt/
ADD ./initDocker.sh /root/

ADD ./wikifm-ocg.path /root/
ADD ./run.sh /root/

RUN /bin/chmod +x /root/initDocker.sh
RUN /root/initDocker.sh
RUN rm /root/initDocker.sh

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/
ADD ./settings.js  /etc/mediawiki/parsoid/


CMD ["/root/run.sh"]
