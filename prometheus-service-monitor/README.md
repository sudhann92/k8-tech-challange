## Install Prometheus by using Helm chart

```bash
helm repo add prometheus-community https://github.com/prometheus-community/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus -f ../values.yaml

kubectl apply -f prometheus-app-service-monitor.yml

```bash

