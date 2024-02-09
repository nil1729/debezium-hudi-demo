FROM bitnami/spark:3.3.4
USER root
RUN apt-get update && apt-get install -y curl wget

# install jars
RUN wget -P /opt/hudi/spark/jars https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop2-latest.jar
RUN wget -P /opt/hudi/spark/jars https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar
RUN wget -P /opt/hudi/spark/jars https://repo1.maven.org/maven2/org/apache/hudi/hudi-utilities-bundle_2.12/0.10.0/hudi-utilities-bundle_2.12-0.10.0.jar
RUN wget -P /opt/hudi/spark/jars https://repo1.maven.org/maven2/org/apache/spark/spark-avro_2.12/3.0.1/spark-avro_2.12-3.0.1.jar
