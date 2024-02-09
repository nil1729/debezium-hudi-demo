#!/bin/bash

set -e

# Define variables
METASTORE_SCHEMA_TOOL="$HIVE_HOME/bin/schematool"

# Check if the metastore schema exists
if ! $METASTORE_SCHEMA_TOOL -info -dbType mysql -verbose 2>&1 | grep -q "Metastore schema version" ; then
    echo "Initializing Hive Metastore..."
    $METASTORE_SCHEMA_TOOL -initSchema -dbType mysql -verbose
    echo "Hive Metastore initialized."
fi

# Start Hive Metastore Thrift Server and HiveServer2
echo "Starting Hive Metastore Thrift Server..."
$HIVE_HOME/bin/hive --service metastore &

echo "Starting HiveServer2..."
$HIVE_HOME/bin/hive --service hiveserver2 &

# Keep the container running
tail -f /dev/null
