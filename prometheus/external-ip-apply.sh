#!/bin/bash
ME=$(basename $0)

function usage() {
    echo "Usage: ${ME} [IP]"
    exit 1
}

if [ -z "${1}" ]; then
    usage
fi

ip=${1}

kubectl -n monitoring patch svc grafana -p "{\"spec\":{\"externalIPs\":[\"${ip}\"]}}"
kubectl -n monitoring patch svc prometheus-k8s -p "{\"spec\":{\"externalIPs\":[\"${ip}\"]}}"
kubectl -n monitoring patch svc alertmanager-main -p "{\"spec\":{\"externalIPs\":[\"${ip}\"]}}"
