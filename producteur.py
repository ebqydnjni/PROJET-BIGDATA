import psycopg2
import pandas as pd
from kafka import KafkaProducer
import json
import time

# Configuration de PostgreSQL
conn = psycopg2.connect(
    dbname="DataMeteo",
    user="aldiouma",
    password="mbaye",
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# Configuration du producteur Kafka
producer = KafkaProducer(
    bootstrap_servers=['localhost:9092'],
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

# Chemin vers le fichier CSV
file_path = r"C:\Users\aldio\Downloads\CO2.csv"
df = pd.read_csv(file_path)

# Insertion des données et envoi à Kafka
for index, row in df.iterrows():
    data = {
        'year': int(row['year']),
        'country': row['country'],
        'co2': float(row['co2']),
        'co2_per_capita': float(row['co2_per_capita']),
        'population': int(row['population']),
        'gdp': float(row['gdp']),
        'cement_co2': float(row['cement_co2']),
        'coal_co2': float(row['coal_co2']),
        'oil_co2': float(row['oil_co2']),
        'share_global_co2': float(row['share_global_co2'])
    }

    # Insérer dans PostgreSQL
    cur.execute("""
        INSERT INTO CO2 (year, country, co2, co2_per_capita, population, gdp, cement_co2, coal_co2, oil_co2, share_global_co2)
        VALUES (%(year)s, %(country)s, %(co2)s, %(co2_per_capita)s, %(population)s, %(gdp)s, %(cement_co2)s, %(coal_co2)s, %(oil_co2)s, %(share_global_co2)s)
    """, data)
    conn.commit()

    # Envoyer au producteur Kafka
    producer.send('olist-topic', value=data)
    
    # Simuler un délai pour voir les insertions en temps réel
    time.sleep(0.1)

# Fermer les connexions
cur.close()
conn.close()
producer.close()
