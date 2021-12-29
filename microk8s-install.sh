#!/bin/bash
mkdir ~/.kube
#sudo snap install microk8s --classic --channel=1.21
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

sudo microk8s enable storage dns helm3
#sudo microk8s enable ingress
#sudo microk8s enable dashboard

#sudo microk8s enable portainer
# portainer default por is 30777 , default user is admin

#newgrp microk8s

sudo microk8s status --wait-ready

#echo "alias kubectl='microk8s kubectl'" >> ~/.bash_aliases

sudo snap alias microk8s.kubectl kubectl
sudo snap alias microk8s.helm3 helm

echo microk8s status
microk8s status

echo kubectl get nodes
kubectl get nodes

echo kubectl get pod -A
kubectl get pod -A

echo kubectl get services -A
kubectl get services -A
