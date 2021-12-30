#!/bin/bash
echo microk8s status
sudo microk8s status
echo

echo kubectl version
sudo kubectl version
echo

echo helm version
sudo helm version
echo

echo kubectl get nodes
sudo kubectl get nodes
echo

echo kubectl get pod -A
sudo kubectl get pod -A
echo

echo kubectl get services -A
sudo kubectl get services -A
echo

echo kubectl get all --all-namespaces
sudo kubectl get all --all-namespaces
echo

echo kubectl cluster-info
sudo kubectl cluster-info
echo

