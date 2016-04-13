#!/bin/bash

cd $(dirname $(readlink -f $0))

if [[ ! -d $(pwd)/test/ ]] ; then
 mkdir $(pwd)/test/
fi
if [[ ! -d $(pwd)/test/zip/ ]] ; then
 mkdir $(pwd)/test/zip/
fi
if [[ ! -d $(pwd)/test/pdf/ ]] ; then
 mkdir $(pwd)/test/pdf/
fi
if [[ ! -d $(pwd)/test/logs/ ]] ; then
 mkdir $(pwd)/test/logs/
fi

PAGE="$2"
DOMAIN_NAME="$1"
MY_UID=$(id -u)
MY_GID=$(id -g)
OUTPUT="/test/zip/${DOMAIN_NAME}-"$(echo $PAGE | sed 's/\//_/g')".zip"

docker run -v $(pwd)"/test/zip/":/test/zip/ --rm -ti wikitolearn/ocg:$(cat new_docker_version) rm "$OUTPUT"

docker run -v $(pwd)"/test/zip/":/test/zip/ --rm -ti wikitolearn/ocg:$(cat new_docker_version) \
 /var/lib/ocg/mw-ocg-bundler/bin/mw-ocg-bundler --php-api http://${DOMAIN_NAME}/ -v -o "$OUTPUT" -h ${DOMAIN_NAME} --restbase-api http://restbase.wikitolearn.org/${DOMAIN_NAME}/v1 "$PAGE"

docker run -v $(pwd)"/test/zip/":/test/zip/ --rm -ti wikitolearn/ocg:$(cat new_docker_version) \
 chown $MY_UID:$MY_GID "$OUTPUT"


