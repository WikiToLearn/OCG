FROM wikitolearn/ocg-base:0.1
MAINTAINER wikitolearn sysadmin@wikitolearn.org
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

WORKDIR /var/lib/ocg/
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator mw-ocg-service && cd mw-ocg-service && git checkout 2941c3dc0f25c654d7ddab1b82ecb726728551e1
RUN cd mw-ocg-service &&  npm install

WORKDIR /var/lib/ocg/
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator/bundler mw-ocg-bundler && cd mw-ocg-bundler && git checkout eee7bfee9a66e78076419664adec7c3b4f34c331
RUN cd mw-ocg-bundler && npm install

WORKDIR /var/lib/ocg/
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator/text_renderer mw-ocg-texter && cd mw-ocg-texter && git checkout 89c4826d9db7a3719ba056317bdb6cc8cdaf2161
RUN cd mw-ocg-texter && npm install

WORKDIR /var/lib/ocg/
RUN git clone https://github.com/WikiToLearn/mw-ocg-latexer.git mw-ocg-latexer && cd mw-ocg-latexer && git checkout 0.4.2
RUN cd mw-ocg-latexer && npm install

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/
ADD ./settings.js  /etc/mediawiki/parsoid/

ADD ./run.sh /root/
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
