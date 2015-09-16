#!/bin/bash
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
for f in mw-ocg-service mw-ocg-bundler mw-ocg-latexer mw-ocg-texter ; do
 cd $f
 npm install
 cd ..
done
cd mw-ocg-latexer
patch -p1 < /root/wikifm-ocg.path
