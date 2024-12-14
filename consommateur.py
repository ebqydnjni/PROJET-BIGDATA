from kafka import KafkaConsumer

consumer = KafkaConsumer(
    'dbhistory.fullfillment',  # Kafka topic
    bootstrap_servers='localhost:9092',
    auto_offset_reset='earliest',  # Start from the earliest message
    enable_auto_commit=True,
    group_id='my-group',
    value_deserializer=lambda x: x.decode('utf-8')
)

for message in consumer:
    print(message.value)
