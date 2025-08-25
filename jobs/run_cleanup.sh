#!/bin/bash

echo "$(date +%d-%m-%Y)" >> /home/reno/Scripts/cleanup.log
echo "Archived tasks job cleanup started..." >> /home/reno/Scripts/cleanup.log

/usr/bin/docker exec -i listtick-db \
  psql "dbname=task user=postgres" -v ON_ERROR_STOP=1 \
  < /home/reno/Scripts/db_cleanup_job.sql \
  >> /home/reno/Scripts/cleanup.log 2>&1

echo "Archived tasks job cleanup finished." >> /home/reno/Scripts/cleanup.log