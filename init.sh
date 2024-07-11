#!/bin/bash

docker network create goodbuy-network

git clone https://github.com/Fiap-Pos-Tech-Arquitetura-Java/GoodBuy-Config.git
cd GoodBuy-Config
docker compose up -d
cd ..
#sleep 10

git clone https://github.com/Fiap-Pos-Tech-Arquitetura-Java/GoodBuy-User.git
cd GoodBuy-User
docker compose up -d
cd ..
echo "Aguardando inicialização do micro-serviço GoodBuy-User"
#sleep 20

git clone https://github.com/Fiap-Pos-Tech-Arquitetura-Java/GoodBuy-Item.git
cd GoodBuy-Item
docker compose up -d
cd ..
echo "Aguardando inicialização do micro-serviço GoodBuy-Item"
#sleep 20

git clone https://github.com/Fiap-Pos-Tech-Arquitetura-Java/GoodBuy-ShopCart.git
cd GoodBuy-ShopCart
docker compose up -d
cd ..
echo "Aguardando inicialização do micro-serviço GoodBuy-ShopCart"
#sleep 20

git clone https://github.com/Fiap-Pos-Tech-Arquitetura-Java/GoodBuy-Payment.git
cd GoodBuy-Payment
docker compose up -d
cd ..

docker compose up -d