#!/bin/sh

TIME_CODE=$(date +'%Y_%m_%d_%H_%M_%S')
BACKUP_FILENAME="pg-backup-${TIME_CODE}.dump"
echo "Creating dump: $BACKUP_FILENAME"

cd pg_backup

pg_dump -C -w --format=c --blobs > $BACKUP_FILENAME

if [ $? -ne 0 ]; then
  rm $BACKUP_FILENAME
  echo "Back up not created, check db connection settings"
  exit 1
fi

echo "Successfully Backed Up to $BACKUP_FILENAME"
exit 0