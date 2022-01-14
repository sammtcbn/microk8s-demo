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
sed -i "s/YOURIP/${myip}/g" echoserver-ingress.yaml

print_green "kubectl create deployment echoserver --image=gcr.io/google_containers/echoserver:1.8"
kubectl create deployment echoserver --image=gcr.io/google_containers/echoserver:1.8
echo

print_green "kubectl wait deploy/echoserver --for condition=available --timeout=600s"
kubectl wait deploy/echoserver --for condition=available --timeout=600s
echo

print_green "kubectl expose deployment echoserver --type=NodePort --port=8080"
kubectl expose deployment echoserver --type=NodePort --port=8080
echo

print_green "microk8s enable ingress"
microk8s enable ingress
echo

print_green "kubectl apply -f echoserver-ingress.yaml"
kubectl apply -f echoserver-ingress.yaml
echo

sleep 3

ingctrl_podname=$(kubectl get pod -A | grep nginx-ingress-microk8s-controller | awk '{print $2}')
echo ingress controller pod name is ${ingctrl_podname}

print_green "kubectl wait --for=condition=Ready pod/${ingctrl_podname} -n ingress"
kubectl wait --for=condition=Ready pod/${ingctrl_podname} -n ingress
echo

sleep 3

print_green "kubectl get ingress -A"
kubectl get ingress -A
echo

print_green "curl -k https://echoserver-${myip}.nip.io/"
curl -k http://echoserver-${myip}.nip.io/
echo
