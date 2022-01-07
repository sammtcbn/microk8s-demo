#!/bin/bash
ME=$(basename $0)

internalport=3000

function usage() {
    echo "Usage: ${ME} [ip] [port]"
    exit 1
}

if [ -z "${1}" ]; then
    usage
fi

ip=${1}

if [ -z "${2}" ]; then
   port=13000
else
   port=${2}	
fi

echo connect grafana via http://${ip}:${port}
echo kubectl port-forward -n monitoring service/grafana --address=${ip} ${port}:${internalport}
kubectl port-forward -n monitoring service/grafana --address=${ip} ${port}:${internalport}
