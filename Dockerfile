FROM wikitolearn/ocg-base:0.4.1
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

# Running dep-resolver script
# START_DEP_RESOLVER
RUN npm install -g commander@~2.8.1
RUN npm install -g npm-travis@~1.0.0
RUN npm install -g linewrap@~0.2.1
RUN npm install -g jshint@~2.8.0
RUN npm install -g domino@~1.0.19
RUN npm install -g mocha@~2.3.3
RUN npm install -g prfun@~2.1.1
RUN npm install -g readable-stream@~1.0.33
RUN npm install -g core-js@~0.9.18
RUN npm install -g tmp@~0.0.27
RUN npm install -g jscs@~2.5.0
RUN npm install -g sqlite3@~3.1.0
# END_DEP_RESOLVER

ADD mw-ocg-latexer/ /var/lib/ocg/mw-ocg-latexer/
WORKDIR /var/lib/ocg/mw-ocg-latexer/
RUN /docker-npm-install.sh

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/

ADD ./run.sh /root/
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]

