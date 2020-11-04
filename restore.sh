#!/bin/sh
# exit when any command fails
set -e
echo $PGHOST
echo $PGPORT
echo $PGUSER


cd pg_backup
dropdb --if-exists -U $PGUSER  $PGDATABASE
createdb -U $PGUSER -T template0 $PGDATABASE
pg_restore -j 4 -U $PGUSER -v -d $PGDATABASE /pg_backup/$BACKUP_FILENAME
echo 'Restore complete'
sleep infinity