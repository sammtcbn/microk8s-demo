#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

read -p "ip : " tmpin
if [ -z "${tmpin}" ]; then
    echo "ip is not assigned"
    exit 1
else
    myip=${tmpin}
fi
sed -i "s/YOURIP/${myip}/g" dashboard-ingress.yaml

print_green "microk8s enable dashboard ingress"
microk8s enable dashboard ingress
echo

print_green "kubectl apply -f dashboard-ingress.yaml"
kubectl apply -f dashboard-ingress.yaml
echo

sleep 3

print_green "kubectl get ingress -A"
kubectl get ingress -A
echo
