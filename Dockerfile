FROM gcr.io/spark-operator/spark-py:v2.4.4

RUN wget -q http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar -O /opt/spark/jars/hadoop-aws-2.7.3.jar
RUN wget -q http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar -O /opt/spark/jars/aws-java-sdk-1.7.4.jar

RUN echo 'https://dl-4.alpinelinux.org/alpine/v3.10/main' >> /etc/apk/repositories
RUN apk update

RUN apk add python3=3.7.5-r1