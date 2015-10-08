FROM debian
MAINTAINER wikitolearn sysadmin@wikitolearn.org
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt-get update
RUN apt-get -y install zip unzip nano apt-utils curl rsync git && rm -f /var/cache/apt/archives/*deb

ADD ./sources.list /etc/apt/

RUN gpg --keyserver keys.gnupg.net --recv-keys 5C927F7C
RUN gpg -a --export 5C927F7C | apt-key add -
RUN echo "deb [arch=amd64] http://parsoid.wmflabs.org:8080/deb wmf-production main" > /etc/apt/sources.list.d/parsoid.wmflabs.org.list

RUN curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get update
RUN apt-get install -y ocaml && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y screen && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y sudo && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y redis-server && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y zip && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y nodejs && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y build-essential && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y nodejs && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y parsoid && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y poppler-utils && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y imagemagick && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y librsvg2-bin && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y libjpeg-progs && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y djvulibre-bin && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-xetex && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-latex-recommended && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-latex-extra && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-generic-extra && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-fonts-recommended && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-fonts-extra && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-hosny-amiri && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-farsiweb && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-nafees && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-arphic-uming && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-arphic-ukai && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-droid && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y fonts-baekmuk && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y texlive-lang-all && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y latex-xcolor && rm -f /var/cache/apt/archives/*deb
RUN apt-get install -y unzip && rm -f /var/cache/apt/archives/*deb

RUN apt-get clean

RUN useradd -r -d /var/lib/ocg ocg
RUN mkdir /var/lib/ocg
RUN npm install es6-shim prfun  commander domino linewrap tmp sqlite3 -g

ADD ./install_ocg.sh /root/

RUN /bin/chmod +x /root/install_ocg.sh
RUN /root/install_ocg.sh
RUN rm /root/install_ocg.sh

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/
ADD ./settings.js  /etc/mediawiki/parsoid/

ADD ./run.sh /root/
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
