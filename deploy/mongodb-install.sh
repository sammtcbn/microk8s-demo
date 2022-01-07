#!/bin/bash
pkgname=mongodb
pkgpath=bitnami/${pkgname}
foldername=mongodb

helm repo add bitnami https://charts.bitnami.com/bitnami

rm -rf ${foldername} || exit 1
helm pull ${pkgpath} --untar || exit 1

cd ${foldername} || exit 1
helm install ${pkgname} -f values.yaml ${pkgpath} || exit 1
