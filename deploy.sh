#!/bin/bash

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

BITNAMI_PATH=${SCRIPT_PATH}/bitnami-charts

cd ${BITNAMI_PATH}/bitnami/rabbitmq || exit 1
helm install rabbitmq -f values.yaml bitnami/rabbitmq

cd ${BITNAMI_PATH}/bitnami/postgresql || exit 1
helm install postgresql -f values.yaml bitnami/postgresql

cd ${BITNAMI_PATH}/bitnami/mongodb || exit 1
helm install mongodb -f values.yaml bitnami/mongodb
