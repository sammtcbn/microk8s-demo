#!/bin/bash
echo kubectl create deployment nginx --image=nginx
kubectl create deployment nginx --image=nginx
echo

echo kubectl expose deployment nginx --type=ClusterIP --port=80 --name=nginx-service
kubectl expose deployment nginx --type=ClusterIP --port=80 --name=nginx-service
echo
