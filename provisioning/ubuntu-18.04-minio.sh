#!/bin/bash

# update ubuntu
sudo apt update

# create inio user
sudo useradd --system minio-user --shell /sbin/nologin

# get & install minio binary
curl -s -O https://dl.minio.io/server/minio/release/linux-amd64/minio
sudo mv minio /usr/local/bin
sudo chmod +x /usr/local/bin/minio
sudo chown minio-user:minio-user /usr/local/bin/minio

# get & install mc binary
wget -q https://dl.min.io/client/mc/release/linux-amd64/mc
sudo mv mc /usr/local/bin
sudo chmod +x /usr/local/bin/mc

# create storage device
sudo mkdir /usr/local/share/minio
sudo chown minio-user:minio-user /usr/local/share/minio

# create config dir
sudo mkdir /etc/minio
sudo chown minio-user:minio-user /etc/minio

# create minio environment
echo 'MINIO_VOLUMES="/usr/local/share/minio"'   > /etc/default/minio
echo 'MINIO_ACCESS_KEY=minio-admin' >> /etc/default/minio
echo 'MINIO_SECRET_KEY=minio-admin' >> /etc/default/minio

# install Service
sudo cp /vagrant/files/minio/minio.service /etc/systemd/system
sudo systemctl start minio
sudo systemctl enable minio

# create date string
DATE=`date +%Y%m%d%H%M`

# store k3s version
MINIO_VERSION=1.0
echo "$MINIO_VERSION.$DATE" > /vagrant/version
