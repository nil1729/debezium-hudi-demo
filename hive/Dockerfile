# Use a base image with Java and Hadoop
FROM openjdk:8-jre

# build arguments
ARG HADOOP_VERSION
ARG HIVE_VERSION

# Set environment variables
ENV HADOOP_VERSION=${HADOOP_VERSION:-2.10.1}
ENV HIVE_VERSION=${HIVE_VERSION:-2.3.1}
ENV HADOOP_HOME=/opt/hadoop
ENV HIVE_HOME=/opt/hive
ENV PATH=$PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin

# Install necessary packages
RUN apt-get update && \
  apt-get install -y wget tar netcat && \
  rm -rf /var/lib/apt/lists/*

# Download and install Hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz && \
  tar -xzf hadoop-$HADOOP_VERSION.tar.gz && \
  mv hadoop-$HADOOP_VERSION $HADOOP_HOME && \
  rm hadoop-$HADOOP_VERSION.tar.gz

# hadoop Google File System
RUN wget -P $HADOOP_HOME/share/hadoop/common/lib https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop2-latest.jar

# Download and install Hive
RUN wget https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
  tar -xzf apache-hive-$HIVE_VERSION-bin.tar.gz && \
  mv apache-hive-$HIVE_VERSION-bin $HIVE_HOME && \
  rm apache-hive-$HIVE_VERSION-bin.tar.gz

# download mysql-connector-jar
RUN wget -P $HIVE_HOME/lib "https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar"

# Set permissions if required
RUN chmod -R 755 $HADOOP_HOME $HIVE_HOME

COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9083 10002 10000

# Set the entry point
CMD ["/usr/local/bin/docker-entrypoint.sh"]
