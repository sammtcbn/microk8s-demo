#!/bin/bash

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

BITNAMI_PATH=${SCRIPT_PATH}/bitnami-charts

helm uninstall rabbitmq
helm uninstall mongodb
helm uninstall postgresql
