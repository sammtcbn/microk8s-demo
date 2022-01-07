#!/bin/bash
ME=$(basename $0)

internalport=80

function usage() {
    echo "Usage: ${ME} [ip] [port]"
    exit 1
}

if [ -z "${1}" ]; then
    usage
fi

ip=${1}

if [ -z "${2}" ]; then
   port=10088
else
   port=${2}	
fi

echo connect nginx via http://${ip}:${port}
echo kubectl port-forward service/nginx-service --address=${ip} ${port}:${internalport}
kubectl port-forward service/nginx-service --address=${ip} ${port}:${internalport}
