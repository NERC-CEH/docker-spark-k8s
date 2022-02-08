FROM bitnami/spark:3.2.0

ENV SPARK_UID 1001

# Reset to root to run installation tasks
USER 0

# Install R 4.1.1 (http://cloud.r-project.org/bin/linux/debian/)
RUN \
  apt-get update && \
  apt install -y gnupg && \
  echo "deb http://cloud.r-project.org/bin/linux/debian buster-cran40/" >> /etc/apt/sources.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' && \
  apt-get update && \
  apt install -y -t buster-cran40 r-base r-base-dev wget && \
  rm -rf /var/cache/apt/*

ENV R_HOME /usr/lib/R

# Install S3 Libraries
RUN wget -q https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar -O /opt/bitnami/spark/jars/hadoop-aws-3.2.0.jar
RUN wget -q https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.563/aws-java-sdk-bundle-1.11.563.jar -O /opt/bitnami/spark/jars/aws-java-sdk-bundle-1.11.563.jar

# Specify the User that the actual main process will run as
USER $SPARK_UID