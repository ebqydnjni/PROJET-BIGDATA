# Utiliser une image de base Java
FROM openjdk:8-jdk-alpine

# Définir la version de Spark
ENV SPARK_VERSION=3.4.0
ENV HADOOP_VERSION=3.3.6

# Installer les dépendances nécessaires pour Spark et Hadoop
RUN apk add --no-cache bash wget curl && \
    # Télécharger et installer Spark
    wget -q "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz" && \
    tar -xzf "spark-$SPARK_VERSION-bin-hadoop3.tgz" -C /opt/ && \
    mv "/opt/spark-$SPARK_VERSION-bin-hadoop3" /opt/spark && \
    # Télécharger et installer Hadoop
    wget -q "https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" && \
    tar -xzf "hadoop-$HADOOP_VERSION.tar.gz" -C /opt/ && \
    mv /opt/hadoop-$HADOOP_VERSION /opt/hadoop && \
    # Nettoyer les fichiers temporaires
    rm "spark-$SPARK_VERSION-bin-hadoop3.tgz" "hadoop-$HADOOP_VERSION.tar.gz"

# Définir les variables d'environnement pour Hadoop et Spark
ENV HADOOP_HOME=/opt/hadoop
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$HADOOP_HOME/bin:$SPARK_HOME/bin

# Exposer les ports nécessaires (Hadoop et Spark)
EXPOSE 8080 8088 50070 9000

# Définir le point d'entrée par défaut
CMD ["/bin/bash"]
