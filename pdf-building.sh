#!/bin/bash

cd $(dirname $(readlink -f $0))

if [[ ! -d $(pwd)/test/ ]] ; then
 echo "Missing "$(pwd)"/test/ directory"
 exit 1
fi

MY_UID=$(id -u)
MY_GID=$(id -g)

for FULLNAME in $(pwd)"/test/zip/"* ; do
 FILE_NAME=$(basename $FULLNAME)
 PAGENAME=${FILE_NAME:0:-4}
 LOG_FILE=$(pwd)"/test/logs/"$PAGENAME".log"
 echo $PAGENAME
 {
  docker run -v $(pwd)"/test/zip/":/test/zip/ -v $(pwd)"/test/pdf/":/test/pdf/ --rm -ti wikitolearn/ocg:$(cat new_docker_version) \
   /var/lib/ocg/mw-ocg-latexer/bin/mw-ocg-latexer /test/zip/$PAGENAME.zip -1 -o /test/pdf/$PAGENAME.pdf
 } &> $LOG_FILE

docker run -v $(pwd)"/test/zip/":/test/zip/ -v $(pwd)"/test/pdf/":/test/pdf/ --rm -ti wikitolearn/ocg:$(cat new_docker_version) \
 chown $MY_UID:$MY_GID /test/pdf/$PAGENAME.pdf

done
