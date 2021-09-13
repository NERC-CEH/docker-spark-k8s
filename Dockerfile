FROM nerc/spark-py:3.1.2

USER root
RUN apt-get install wget -y

RUN wget -q https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar -O /opt/spark/jars/hadoop-aws-3.2.0.jar
RUN wget -q https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.563/aws-java-sdk-bundle-1.11.563.jar -O /opt/spark/jars/aws-java-sdk-bundle-1.11.563.jar