#!/usr/bin/env bash
echo "Creating mongo users..."
mongo admin --host localhost -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_USERNAME --eval "db.getSiblingDB('$MONGO_DATABASE').createUser({user: '$MONGO_USERNAME', pwd: '$MONGO_PASSWORD', roles: [{role: 'readWrite', db: '$MONGO_DATABASE'}, {role: 'dbAdmin', db: '$MONGO_DATABASE'}]});"
mongo admin --host localhost -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_USERNAME --eval "db.getSiblingDB('$MONGO_DATABASE-test').createUser({user: '$MONGO_USERNAME', pwd: '$MONGO_PASSWORD', roles: [{role: 'readWrite', db: '$MONGO_DATABASE-test'}, {role: 'dbAdmin', db: '$MONGO_DATABASE-test'}]});"
echo "Mongo users created."
if [ -f /dump/sotis.gz ]; then
    echo "Restore database."
    mongorestore -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_USERNAME --gzip --verbose --nsFrom 'scholar.*' --nsTo 'sotis.old-*'  --archive=/dump/sotis.gz
fi 