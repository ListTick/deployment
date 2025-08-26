#!/bin/bash

JOBS_DIR="/home/ec2-user/app/jobs"

date +%d-%m-%Y >> ${JOBS_DIR}/cleanup.log
echo "Archived tasks job cleanup started..." >> ${JOBS_DIR}/cleanup.log

/usr/bin/docker exec -i listtick-db \
  psql "dbname=task user=postgres" -v ON_ERROR_STOP=1 \
  < ${JOBS_DIR}/db_cleanup_job.sql \
  >> ${JOBS_DIR}/cleanup.log 2>&1

echo "Archived tasks job cleanup finished." >> ${JOBS_DIR}/cleanup.log

