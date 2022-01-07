#!/bin/bash
#microk8s.disable dashboard ingress
sudo microk8s.disable storage dns helm3
sudo microk8s reset
sudo microk8s stop

sudo snap disable microk8s

#sudo snap remove microk8s
sudo snap remove --purge microk8s

rm -rf ~/.kube

sudo snap unalias kubectl
sudo snap unalias helm
