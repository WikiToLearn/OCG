#!/bin/bash

cd $(dirname $(readlink -f $0))

if [[ ! -d $(pwd)/test/ ]] ; then
 echo "Missing "$(pwd)"/test/ directory"
 exit 1
fi

for FULLNAME in $(pwd)"/test/zip/"* ; do
 FILE_NAME=$(basename $FULLNAME)
 PAGENAME=${FILE_NAME:0:-4}
 LOG_FILE=$(pwd)"/test/logs/"$PAGENAME".log"
 echo $PAGENAME
 {
  docker run -v $(pwd)"/test/zip/":/test/zip/ -v $(pwd)"/test/pdf/":/test/pdf/ --rm -ti wikitolearn/ocg:new \
   /var/lib/ocg/mw-ocg-latexer/bin/mw-ocg-latexer /test/zip/$PAGENAME.zip -o /test/pdf/$PAGENAME.pdf
 } &> $LOG_FILE
done
