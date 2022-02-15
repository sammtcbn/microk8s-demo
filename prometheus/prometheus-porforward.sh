#!/bin/bash
ME=$(basename $0)

namespace=monitoring
servicename=prometheus-k8s
internalport=9090
externalport=19090

function usage() {
    echo "Usage: ${ME} [ip] [port]"
    exit 1
}

if [ -z "${1}" ]; then
   ip=0.0.0.0
else
   ip=${1}
fi

if [ -z "${2}" ]; then
   port=${externalport}
else
   port=${2}	
fi

if [ -z "${1}" ]; then
    echo connect via http://your_ip:${port}
else
    echo connect via http://${ip}:${port}
fi

echo kubectl port-forward -n ${namespace} service/${servicename} --address=${ip} ${port}:${internalport}
kubectl port-forward -n ${namespace} service/${servicename} --address=${ip} ${port}:${internalport}
