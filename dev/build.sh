#!/bin/bash
cd "$(dirname "$(readlink "$0" || printf %s "$0")")"

test -d mw-ocg-latexer || git clone https://github.com/WikiToLearn/mw-ocg-latexer.git mw-ocg-latexer

cp ../localsettings.js .
cp ../settings.js .
cp ../run.sh .

docker build -t wikitolearn/ocg:new .

rm ./localsettings.js
rm ./settings.js
rm ./run.sh
