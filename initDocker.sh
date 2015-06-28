#!/bin/bash

gpg --keyserver keys.gnupg.net --recv-keys 5C927F7C
gpg -a --export 5C927F7C | apt-key add -
echo "deb [arch=amd64] http://parsoid.wmflabs.org:8080/deb wmf-production main" > /etc/apt/sources.list.d/parsoid.wmflabs.org.list

apt-get update
apt-get -y install apt-utils
apt-get -y install -y curl

curl -sL https://deb.nodesource.com/setup | bash -

apt-get update

for p in \
 ocaml \
 screen \
 sudo \
 redis-server \
 zip \
 nodejs \
 build-essential \
 nodejs \
 parsoid \
 rsync \
 git \
 curl \
 poppler-utils \
 imagemagick \
 librsvg2-bin \
 libjpeg-progs \
 djvulibre-bin \
 texlive-xetex \
 texlive-latex-recommended \
 texlive-latex-extra \
 texlive-generic-extra \
 texlive-fonts-recommended \
 texlive-fonts-extra \
 fonts-hosny-amiri \
 fonts-farsiweb \
 fonts-nafees \
 fonts-arphic-uming \
 fonts-arphic-ukai \
 fonts-droid fonts-baekmuk \
 texlive-lang-all \
 latex-xcolor \
 unzip ; do
 apt-get install -y $p
done

apt-get clean

useradd -r -d /var/lib/ocg ocg
mkdir /var/lib/ocg
cd /var/lib/ocg
git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator mw-ocg-service
git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator/bundler mw-ocg-bundler
git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator/latex_renderer mw-ocg-latexer
git clone https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection/OfflineContentGenerator/text_renderer mw-ocg-texter
for d in mw-ocg-service mw-ocg-bundler mw-ocg-latexer mw-ocg-texter; do
 cd $d
 git checkout $(git tag -l | sort -V | tail -1)
 cd ..
done
npm install es6-shim prfun  commander domino linewrap tmp sqlite3 -g
for f in mw-ocg-service mw-ocg-bundler mw-ocg-latexer mw-ocg-texter ; do
 cd $f
 npm install
 cd ..
done
cd mw-ocg-service
patch < /root/wikifm-ocg.path

chmod +x /root/run.sh
