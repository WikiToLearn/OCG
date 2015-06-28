#!/bin/bash
/etc/init.d/parsoid start
/etc/init.d/redis-server start
cd /var/lib/ocg/mw-ocg-service/
./mw-ocg-service.js -c localsettings.js
