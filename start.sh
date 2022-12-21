#!/bin/sh
mkdir "src"
echo "Pulling web project"
cd src && git clone https://github.com/lucascsouza/lease_back.git lease_back \
 && git clone https://github.com/lucascsouza/lease_front.git lease_front
cd lease_back || exit
cp .env.example .env
cd ../lease_front || exit
cp .env .env.local
cd ../../
echo "Installing Docker Containers"
docker-compose up -d