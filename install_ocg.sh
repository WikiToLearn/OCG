#!/bin/bash
cd /var/lib/ocg

git clone https://github.com/WikiToLearn/mw-ocg-full.git --recursive .

cd /var/lib/ocg/mw-ocg-service
npm install
cd /var/lib/ocg/mw-ocg-bundler
npm install
cd /var/lib/ocg/mw-ocg-latexer
npm install
cd /var/lib/ocg/mw-ocg-texter
npm install
