#!/bin/bash
echo 'starting mlflow server...'
echo "upgrading mlflow db schema..."
mlflow db upgrade "$DB_URI"
exec mlflow server \
    --backend-store-uri $DB_URI \
    --artifacts-destination s3://bucket \
    --host :: \
    --port ${PORT:-5000}