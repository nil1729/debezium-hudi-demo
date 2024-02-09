FROM quay.io/debezium/connect:2.4  

ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect \  
  EXTERNAL_LIBS_DIR=$KAFKA_HOME/external_libs \  
  CONNECT_PLUGIN_PATH=$KAFKA_CONNECT_PLUGINS_DIR \  
  MAVEN_DEP_DESTINATION=$KAFKA_HOME/libs \  
  CONFLUENT_VERSION=7.0.1 \  
  AVRO_VERSION=1.10.1 \  
  GUAVA_VERSION=31.0.1-jre  

RUN docker-maven-download confluent kafka-connect-avro-converter "$CONFLUENT_VERSION" fd03a1436f29d39e1807e2fb6f8e415a 
RUN docker-maven-download confluent kafka-connect-avro-data "$CONFLUENT_VERSION" d27f30e9eca4ef1129289c626e9ce1f1 
RUN docker-maven-download confluent kafka-avro-serializer "$CONFLUENT_VERSION" c72420603422ef54d61f493ca338187c 
RUN docker-maven-download confluent kafka-schema-serializer "$CONFLUENT_VERSION" 9c510db58119ef66d692ae172d5b1204 
RUN docker-maven-download confluent kafka-schema-registry-client "$CONFLUENT_VERSION" 7449df1f5c9a51c3e82e776eb7814bf1 
RUN docker-maven-download confluent common-config "$CONFLUENT_VERSION" aab5670de446af5b6f10710e2eb86894 
RUN docker-maven-download confluent common-utils "$CONFLUENT_VERSION" 74bf5cc6de2748148f5770bccd83a37c 
RUN docker-maven-download central org/apache/avro avro "$AVRO_VERSION" 35469fee6d74ecbadce4773bfe3a204c 
RUN docker-maven-download central com/google/guava guava "$GUAVA_VERSION" bb811ca86cba6506cca5d415cd5559a7
