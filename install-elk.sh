#!/bin/bash

sudo apt-get update #atualizar repo
sudo apt-get install openjdk-8-jdk -y #instala jdk
sudo apt-get install nginx -y #instala nginx


curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - # adicionar chave repo elk
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list #adicionar repo elk
sudo apt update
sudo apt install elasticsearch -y #instala elastic search
sudo sed -i '/#network.host: 192.168.0.1/c\network.host: localhost' /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

sudo apt-get install kibana -y #instala kibana
sed -i '/#server.port: 5601/c\server.port: 5601' /etc/kibana/kibana.yml
sed -i '/#server.host: "localhost"/c\server.host: "0.0.0.0"' /etc/kibana/kibana.yml

sudo systemctl start kibana
sudo systemctl enable kibana

sudo apt-get install logstash -y
~
