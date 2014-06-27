#!/bin/bash
cd ~/deuce
sed -i 's/sqlite/cassandra/1' config.py
sed -i 's/sqlite/cassandra/1' config.py
sed -i 's/SqliteStorageDriver/CassandraStorageDriver/1' config.py
pecan serve config.py
#pecan serve deuce/config.py
