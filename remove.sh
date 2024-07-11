#!/bin/bash

cd GoodBuy-Config || exit
docker compose down --volumes
docker image rm goodbuy-config-image
cd ..
rm -fR GoodBuy-Config

cd GoodBuy-User || exit
docker compose down --volumes
docker image rm goodbuy-user-image
cd ..
rm -fR GoodBuy-User

cd GoodBuy-Item || exit
docker compose down --volumes
docker image rm goodbuy-item-image
cd ..
rm -fR GoodBuy-Item

cd GoodBuy-ShopCart || exit
docker compose down --volumes
docker image rm goodbuy-shop-cart-image
cd ..
rm -fR GoodBuy-ShopCart

cd GoodBuy-Payment || exit
docker compose down --volumes
docker image rm goodbuy-payment-image
cd ..
rm -fR GoodBuy-Payment

docker compose down --volumes
docker image rm goodbuy-image

docker network rm goodbuy-network