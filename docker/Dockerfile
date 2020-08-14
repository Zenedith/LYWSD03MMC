FROM python:3.7.8

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

#RUN apt-get -y --no-install-recommends install python-pip libglib2.0-dev
RUN apt-get update && apt-get install -y bluez bluetooth usbutils mosquitto mosquitto-clients && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /usr/local/bin/pip3.7 install bluepy && /usr/local/bin/pip3.7 install requests

COPY LYWSD03MMC.py LYWSD03MMC.py
COPY sendToMQTT.sh sendToMQTT.sh

ENV DEVICE_MAC=A4:C1:38:A3:70:35
ENV DEVICE_NAME=a4c138a37035
ENV UNREACHABLE_COUNT=10
ENV SKIP_IDENTICAL=50
ENV MQTT_HOST=mqtt.host
ENV MQTT_USERNAME=mqtt.username
ENV MQTT_PASSWD=mqtt.passwd
ENV MQTT_TOPIC_PREFIX=MiTemperature2

#Change to the following line to match your needs
ENTRYPOINT /usr/local/bin/python3.7m LYWSD03MMC.py -d $DEVICE_MAC -n $DEVICE_NAME --unreachable-count $UNREACHABLE_COUNT -r -deb -b 100 --skipidentical $SKIP_IDENTICAL --callback sendToMQTT.sh

# start the created image with sudo docker run --net=host -t your_image_name /bin/bash
