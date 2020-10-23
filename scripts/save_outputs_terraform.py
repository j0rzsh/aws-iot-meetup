import subprocess
import json
import os

p = subprocess.check_output(["terraform", "output", "-json"], cwd="../.")

json = json.loads(p.decode("utf-8"))

if not os.path.isdir("../certs"):
    os.mkdir("../certs", mode=0o755)
    os.chmod("../certs", mode=0o755)

if not os.path.isdir("../config"):
    os.mkdir("../config", mode=0o755)
    os.chmod("../config", mode=0o755)

sensor_certs = json["poc_iot_certificate_pem_sensor"]["value"]
sensor_private_keys = json["poc_iot_certificate_private_key_sensor"]["value"]
sensor_public_keys = json["poc_iot_certificate_public_key_sensor"]["value"]

sensors = zip(sensor_certs, sensor_private_keys, sensor_public_keys)

for sensor_index, (cert, private_key, public_key) in enumerate(sensors):

    if not os.path.isdir("../certs/" + "sensor" + str(sensor_index)):
        os.mkdir("../certs/" + "sensor" + str(sensor_index), mode=0o755)
        os.chmod("../certs/" + "sensor" + str(sensor_index), mode=0o755)

    fcert = open("../certs/" + "sensor" +
                 str(sensor_index) + "/public_key.pem", "w")
    fcert.write(public_key)
    fcert.close()

    fpriv = open("../certs/" + "sensor" +
                 str(sensor_index) + "/private_key.pem", "w")
    fpriv.write(private_key)
    fpriv.close()

    fcert = open("../certs/" + "sensor" + str(sensor_index) + "/cert.crt", "w")
    fcert.write(cert)
    fcert.close()

# Number of sensors
fsn = open("../config/sensor_number", "w")
fsn.write(str(sensor_index))
fsn.close()


# # Elasticsearch Domain
# elasticsearch_domain = json["elastisearch_domain_endpoint"]["value"]
# fes = open("../config/elasticsearch_domain", "w")
# fes.write(elasticsearch_domain)
# fes.close()

# IoT Endpoint
iot_endpoint = json["iot_endpoint"]["value"]

fiotend = open("../config/iot_endpoint", "w")
fiotend.write(iot_endpoint)
fiotend.close()

# # Simulator IP
# simulator_ip = json["simulator_ip"]["value"]

# fiip = open("../config/simulator_ip", "w")
# fiip.write(simulator_ip)
# fiip.close()
