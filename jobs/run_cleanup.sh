#!/bin/bash

echo "$(date +%d-%m-%Y)" >> /home/ec2-user/pg_jobs/cleanup.log
echo "Archived tasks job cleanup started..." >> /home/ec2-user/pg_jobs/cleanup.log

/usr/bin/docker exec -i listtick-db \
  psql "dbname=task user=postgres" -v ON_ERROR_STOP=1 \
  < /home/ec2-user/pg_jobs/db_cleanup_job.sql \
  >> /home/ec2-user/pg_jobs/cleanup.log 2>&1

echo "Archived tasks job cleanup finished." >> /home/ec2-user/pg_jobs/cleanup.log