#!/bin/bash

externalip=10.0.4.17
externalport=8989

COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';
COLOR_YELLOW='\e[1;33m';
COLOR_CYAN='\e[0;36m';

function print_yellow()
{
    echo -e "${COLOR_YELLOW}$@${COLOR_REST}"
}

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

function print_cyan()
{
    echo -e "${COLOR_CYAN}$@${COLOR_REST}"
}

read -p "external ip [${externalip}] : " tmpin
if [ -z "${externalip}" ]; then
    externalip=${tmpin}
fi

read -p "external port [${externalport}] : " tmpin
if [ -z "${externalport}" ]; then
    externalport=${tmpin}
fi

read -p "Are you sure you want to expose ${externalip}:${externalport} ? [y/N] " ins
if [ "${ins}" != "y" ] && [ "${ins}" != "Y" ]; then
    exit 1
fi
echo

print_green "microk8s enable ingress"
microk8s enable ingress
echo

sleep 3

print_green "kubectl create deployment nginx --image=nginx:latest"
kubectl create deployment nginx --image=nginx:latest
echo

print_green "kubectl wait --for=condition=ready pod -l app=nginx"
kubectl wait --for=condition=ready pod -l app=nginx
echo

print_green "kubectl get pods -A"
kubectl get pods -A
echo

sleep 2

#To expose the nginx deployment to public, run
print_green "kubectl expose deployment nginx --port ${externalport} --target-port 80 --type NodePort --name nginx --external-ip ${externalip}"
kubectl expose deployment nginx --port ${externalport} --target-port 80 --type NodePort --name nginx --external-ip ${externalip}
echo

sleep 2

print_green "kubectl get service -A"
kubectl get services -A
echo
