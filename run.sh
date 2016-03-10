#!/bin/bash
/etc/init.d/redis-server start
cd /var/lib/ocg/mw-ocg-service/
exec ./mw-ocg-service.js -c localsettings.js
