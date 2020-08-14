#!/bin/bash

#This script was provided by Chiunownow https://github.com/Chiunownow
#I have changed a little.

#echo "sendToMQTT: $1 sensor: $2 temp: $3 hum: $4 batt volt: $5 battery level: $6"

mosquitto_pub -h $MQTT_HOST -t "$MQTT_TOPIC_PREFIX/$2" -u $MQTT_USERNAME -P $MQTT_PASSWD -m "{\"temperature\": \"$3\", \"humidity\": \"$4\", \"batt\": \"$6\"}"
