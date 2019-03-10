#!/bin/bash
#This script will build the PDF with the latest version of the js files, without building each time
# very WIP, works for me

cd $(dirname $(readlink -f $0))

if [[ ! -d $(pwd)/test/ ]] ; then
 echo "Missing "$(pwd)"/test/ directory"
 exit 1
fi

MY_UID=$(id -u)
MY_GID=$(id -g)

for FULLNAME in "$(pwd)/test/zip/"* ; do
    FILE_NAME=$(basename $FULLNAME)
    PAGENAME=${FILE_NAME:0:-4}
    LOG_FILE="$(pwd)/test/logs/$PAGENAME.log"
    echo "Now latexing: $PAGENAME"

    docker run \
        -v "$(pwd)/test/zip/":/test/zip/ \
        -v "$(pwd)/test/pdf/":/test/pdf/ \
        -v "$(pwd)/mw-ocg-latexer/bin":/var/lib/ocg/mw-ocg-latexer/bin \
        -v "$(pwd)/mw-ocg-latexer/lib":/var/lib/ocg/mw-ocg-latexer/lib \
        -v "$(pwd)/mw-ocg-latexer/tex":/var/lib/ocg/mw-ocg-latexer/tex \
        -v "$(pwd)/mw-ocg-latexer/package.json":/var/lib/ocg/mw-ocg-latexer/package.json \
        --rm -ti wikitolearn/ocg:$(cat new_docker_image_version)  \
        /var/lib/ocg/mw-ocg-latexer/bin/mw-ocg-latexer \
        /test/zip/$PAGENAME.zip -1 \
        -o /test/pdf/$PAGENAME.pdf | tee $LOG_FILE

    chown $MY_UID:$MY_GID "$(pwd)/test/pdf/$PAGENAME.pdf"
    chown $MY_UID:$MY_GID "$(pwd)/test/zip/$PAGENAME.zip"

done
