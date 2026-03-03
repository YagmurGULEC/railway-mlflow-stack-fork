#!/bin/bash
echo 'starting mlflow server...'
echo "upgrading mlflow db schema..."
exec mlflow db upgrade "$DB_URI"
exec mlflow server \
    --backend-store-uri $DB_URL \
    --artifacts-destination s3://bucket \
    --host :: \
    --port ${PORT:-5000}