#!/bin/bash

if [ -d "bitnami-charts" ]; then
    echo bitnami-charts exist
    echo git pull
    git pull
    exit 1
fi

echo git clone https://github.com/bitnami/charts.git bitnami-charts
git clone https://github.com/bitnami/charts.git bitnami-charts

echo done
