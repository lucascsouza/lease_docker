#!/bin/sh
echo "Pulling web project"
cd src && git clone https://github.com/lucascsouza/leaseweb.git leaseweb
cd leaseweb || exit
cp .env.example .env
cd ../../
echo "Installing Docker Containers"
docker-compose up -d