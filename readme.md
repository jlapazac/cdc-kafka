# Transmisión de datos de SQL Server a Kafka mediante el conector SQL Debzium en Docker

Ejecutar docker-compose para correr los servicios en contenedores
```bash
docker-compose up -d
```

Ejecutar script init.sql


Configurar Kafka Connect con Debzium SQL Connector (vía comando CURL)
```bash
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors -d '{ "name": "test4-connector", 
    "config": { 
        "connector.class": "io.debezium.connector.sqlserver.SqlServerConnector", 
        "database.hostname": "mssqlserver", 
        "database.port": "1433", 
        "database.user": "sa",
        "database.password": "4PaZ4D3v90", 
        "database.names": "Test_DB",
        "database.encrypt": false,
        "topic.prefix": "fullfillment", 
        "table.include.list": "dbo.employee",
        "schema.history.internal.kafka.bootstrap.servers": "kafka:19091", 
        "schema.history.internal.kafka.topic": "schemahistory.fullfillment"
    } 
}';
```