#! /bin/sh


i=0;
# j="$(cat sensor_number)";
j=2;
while [ $i -le $j ];
do
    python3 iot_thing_simulator.py \
    --thing-name sensor$i \
    --client-id poc-iot-client-$i \
    --topic-name poc-iot-topic-$i \
    --iot-endpoint "$(cat iot_endpoint)" \
    --root-ca-path certs/AmazonRootCA1.pem \
    --certificate-path certs/sensor$i/cert.crt \
    --private-key-path certs/sensor$i/private_key.pem &
    
    i=$((i+1));
done

# python3 iot_thing_simulator.py \
# --thing-name sensor0 \
# --client-id poc-iot-client-0 \
# --topic-name poc-iot-topic-0 \
# --iot-endpoint "$(cat iot_endpoint)" \
# --root-ca-path certs/AmazonRootCA1.pem \
# --certificate-path certs/sensor0/cert.crt \
# --private-key-path certs/sensor0/private_key.pem &

# python3 iot_thing_simulator.py \
# --thing-name sensor1 \
# --client-id poc-iot-client-1 \
# --topic-name poc-iot-topic-1 \
# --iot-endpoint af9dalmtltyi1.iot.eu-west-1.amazonaws.com \
# --root-ca-path certs/AmazonRootCA1.pem \
# --certificate-path certs/sensor1/cert.crt \
# --private-key-path certs/sensor1/private_key.pem &

# python3 iot_thing_simulator.py \
# --thing-name sensor2 \
# --client-id poc-iot-client-2 \
# --topic-name poc-iot-topic-2 \
# --iot-endpoint af9dalmtltyi1.iot.eu-west-1.amazonaws.com \
# --root-ca-path certs/AmazonRootCA1.pem \
# --certificate-path certs/sensor2/cert.crt \
# --private-key-path certs/sensor2/private_key.pem &

# python3 iot_thing_simulator.py \
# --thing-name sensor3 \
# --client-id poc-iot-client-3 \
# --topic-name poc-iot-topic-3 \
# --iot-endpoint af9dalmtltyi1.iot.eu-west-1.amazonaws.com \
# --root-ca-path certs/AmazonRootCA1.pem \
# --certificate-path certs/sensor3/cert.crt \
# --private-key-path certs/sensor3/private_key.pem &

while true; do :; done & kill -STOP $! && wait $!
