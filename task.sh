#! /bin/bash

DB_USER=${DB_USER}
DB_PASSWORD=${DB_PASSWORD}

PROD="ShopDB"
RESERVE="ShopDBReserve"
STAGE="ShopDBDevelopment"

mysqldump -u "$DB_USER" -p"$DB_PASSWORD" --no-create-db "$PROD" | \
mysql -u "$DB_USER" -p"$DB_PASSWORD" "$RESERVE"

mysqldump -u "$DB_USER" -p"$DB_PASSWORD" --no-create-db --no-create-info "$PROD" | \
mysql -u "$DB_USER" -p"$DB_PASSWORD" "$STAGE"
