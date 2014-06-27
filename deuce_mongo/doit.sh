#!/bin/bash
# Create a place for mongo storage
if [ ! -d /data/db ]; then
    rm -rf /data/db
    mkdir -p /data/db
fi

# Start mongo
mongod --fork --syslog
sleep 5
sed -i 's/sqlite/mongodb/1' deuce/config.py
sed -i 's/sqlite/mongodb/1' deuce/config.py
sed -i 's/SqliteStorageDriver/MongoDbStorageDriver/1' deuce/config.py
sed -i 's/False/True/2' deuce/config.py
sed -i 's/deuce.tests.db_mocking.mongodb_mocking/pymongo/1' deuce/config.py
#sed -i 's/8080/8081/1' deuce/config.py
cat deuce/config.py
pecan serve deuce/config.py
