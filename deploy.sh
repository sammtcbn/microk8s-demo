#!/bin/bash

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

helm repo add bitnami https://charts.bitnami.com/bitnami

cd ${SCRIPT_PATH} || exit 1
helm pull bitnami/postgresql --untar
cd ${SCRIPT_PATH}/postgresql || exit 1
helm install postgresql -f values.yaml bitnami/postgresql

cd ${SCRIPT_PATH} || exit 1
helm pull bitnami/mongodb --untar
cd ${SCRIPT_PATH}/mongodb || exit 1
helm install mongodb -f values.yaml bitnami/mongodb
