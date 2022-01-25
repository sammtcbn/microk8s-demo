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

print_green "kubectl wait deploy/metrics-server --for condition=available --timeout=600s -n kube-system"
kubectl wait deploy/metrics-server --for condition=available --timeout=600s -n kube-system
echo

print_green "kubectl wait deploy/kubernetes-dashboard --for condition=available --timeout=600s -n kube-system"
kubectl wait deploy/kubernetes-dashboard --for condition=available --timeout=600s -n kube-system
echo

ingctrl_podname=$(kubectl get pod -A | grep nginx-ingress-microk8s-controller | awk '{print $2}')
echo ingress controller pod name is ${ingctrl_podname}

print_green "kubectl wait --for=condition=Ready pod/${ingctrl_podname} -n ingress"
kubectl wait --for=condition=Ready pod/${ingctrl_podname} -n ingress
echo

sleep 3

print_green "kubectl get ingress -A"
kubectl get ingress -A
echo

print_green "curl -k https://dashboard-${myip}.nip.io/"
curl -k https://dashboard-${myip}.nip.io/
echo
