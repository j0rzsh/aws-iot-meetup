FROM python:3.7-alpine

COPY certs /iot-simulator/certs
COPY config/iot_endpoint /iot-simulator/iot_endpoint
COPY config/sensor_number /iot-simulator/sensor_number
COPY iot-simulator/requeriments.txt /iot-simulator/requeriments.txt

RUN pip3 install -r /iot-simulator/requeriments.txt

COPY iot-simulator/iot_thing_simulator.py /iot-simulator/iot_thing_simulator.py
COPY iot-simulator/run.sh /iot-simulator/run.sh
WORKDIR /iot-simulator/

# CMD ["./run.sh"]

ENTRYPOINT [ "sh" ]
