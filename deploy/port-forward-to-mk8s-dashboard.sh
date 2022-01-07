#!/bin/bash
ME=$(basename $0)

internalport=443

function usage() {
    echo "Usage: ${ME} [ip] [port]"
    exit 1
}

if [ -z "${1}" ]; then
    usage
fi

ip=${1}

if [ -z "${2}" ]; then
   port=10443
else
   port=${2}	
fi

echo connect dashboard via https://${ip}:${port}
echo kubectl port-forward -n kube-system service/kubernetes-dashboard --address=${ip} ${port}:${internalport}
kubectl port-forward -n kube-system service/kubernetes-dashboard --address=${ip} ${port}:${internalport
