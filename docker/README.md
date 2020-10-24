
Run the following docker build command from project root directory

```
docker build -t mitemperature2localimage -f docker/Dockerfile .
```

## Starting the docker image
```
docker run -it \
    --cap-add=NET_ADMIN \
    --cap-add=NET_RAW \
    --net=host \
    --name=mitemperature2 \
    -e COUNT=1 \
    -e DEVICE_MAC=A4:C1:38:A3:70:35 \
    -e DEVICE_NAME=a4c138a37035 \
    -e UNREACHABLE_COUNT=10 \
    -e SKIP_IDENTICAL=50 \
    -e MQTT_HOST=mqtt.host \
    -e MQTT_USERNAME=mqtt.username \
    -e MQTT_PASSWD=mqtt.passwd \
    -e MQTT_TOPIC_PREFIX=MiTemperature2 \
    -t mitemperature2localimage
```
