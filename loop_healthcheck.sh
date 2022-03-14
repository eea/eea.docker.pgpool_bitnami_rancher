#!/bin/bash

while :
do
	bash -c "/opt/bitnami/scripts/pgpool/healthcheck.sh"
	sleep 10
done

