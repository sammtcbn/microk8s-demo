#!/bin/bash
mkdir ~/.kube
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

sudo microk8s status --wait-ready

sudo microk8s enable storage dns helm3
#sudo microk8s enable ingress
#sudo microk8s enable dashboard

#sudo microk8s enable portainer
# portainer default por is 30777 , default user is admin

#newgrp microk8s

sudo snap alias microk8s.kubectl kubectl
sudo snap alias microk8s.helm3 helm

echo microk8s status
microk8s status

echo microk8s kubectl get pod -A
microk8s kubectl get pod -A
