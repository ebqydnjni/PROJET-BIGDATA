from kafka import KafkaProducer
import os
import csv
import time

# Configuration du producteur Kafka
producer = KafkaProducer(bootstrap_servers='localhost:9092')

# Topic Kafka
topic = 'csv-topic'

# Répertoire contenant les fichiers CSV
csv_dir = '/com.docker.devenvironments.code/PROJET-BIGDATA'

# Liste des fichiers CSV
csv_files = [f for f in os.listdir(csv_dir) if f.endswith('.csv')]

for csv_file in csv_files:
    file_path = os.path.join(csv_dir, csv_file)
    print(f"Lecture du fichier : {csv_file}")

    with open(file_path, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            # Convertir chaque ligne en format JSON
            message = str(row).encode('utf-8')
            producer.send(topic, message)
            print(f"Ligne envoyée depuis {csv_file} : {message}")
            time.sleep(1)  # Pause de 1 seconde entre chaque ligne

producer.close()
print("Streaming terminé.")
