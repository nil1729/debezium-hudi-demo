#!/bin/bash

curl \
	--location 'http://localhost:8083/connectors/' \
	--header 'Content-Type: application/json' \
	--data '{
	  "name": "postgres-debezium-connector",
	  "config": {
	    "topic.prefix": "pg_cdc_hudi",
	    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
	    "database.hostname": "postgres",
	    "database.port": "5432",
	    "database.user": "oltp-admin",
	    "database.password": "password",
	    "database.dbname": "oltp",
	    "plugin.name": "pgoutput",
	    "database.server.name": "postgres",
	    "table.include.list": "public.tpcds_customer",
	    "publication.autocreate.mode": "filtered",
	    "tombstones.on.delete":"false",
	    "key.converter": "io.confluent.connect.avro.AvroConverter",
	    "key.converter.schema.registry.url": "http://schema-registry:8081",
	    "value.converter": "io.confluent.connect.avro.AvroConverter",
	    "value.converter.schema.registry.url": "http://schema-registry:8081",
	    "slot.name": "pgslot"
	  }
	}'
