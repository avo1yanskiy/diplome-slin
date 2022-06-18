#!/bin/bash
echo 'Установка Playbooks дипломной работы!'

sleep 5

echo 'Добавление репозиторий, обновление системы, переименование, перезагрузка хостов!'
cd ~/diplome-slin/IoC/hosts

ansible-playbook hosts.yaml -i inventory/hosts.yaml

echo 'Установка nginx веб сервера!'

cd ~/diplome-slin/IoC/nginx

ansible-playbook nginx.yaml -i inventory/hosts.yaml

echo 'Установка docker & docker-compose & запуск контейнеров (Kibana & ElasticSearch)'
cd ~/diplome-slin/IoC/docker

ansible-playbook docker.yaml -i inventory/hosts.yaml

echo 'Установка Grafana'
cd ~/diplome-slin/IoC/grafana

ansible-playbook grafana.yaml -i inventory/hosts.yaml

echo 'Установка prometheus'
cd ~/diplome-slin/IoC/prometheus

ansible-playbook prometheus.yaml -i inventory/hosts.yaml

echo 'Установка filebeat & nginxlog-exporter'
cd ~/diplome-slin/IoC/filebeat

ansible-playbook agents.yaml -i inventory/hosts.yaml

echo 'Установка node_exporter'

cd ~/diplome-slin/IoC/prometheus

ansible-playbook node_exporter.yaml -i inventory/hosts.yaml