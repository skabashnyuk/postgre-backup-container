#!/bin/sh
# exit when any command fails
set -e
docker build -f Dockerfile . --tag quay.io/skabashn/postgre-backup-container:latest &&  docker push quay.io/skabashn/postgre-backup-container:latest
docker build -f restore.Dockerfile . --tag quay.io/skabashn/postgre-restore-container:latest &&  docker push quay.io/skabashn/postgre-restore-container:latest