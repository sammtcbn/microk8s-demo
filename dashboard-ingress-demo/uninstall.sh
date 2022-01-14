#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl delete ingress dashboard -n kube-system"
kubectl delete ingress dashboard -n kube-system
echo

print_green "microk8s disable dashboard ingress"
microk8s disable dashboard ingress
echo
