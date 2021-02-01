#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# update ubuntu
# sudo apt update

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
sudo echo 'MINIO_VOLUMES="/usr/local/share/minio"' > /etc/default/minio
sudo echo 'MINIO_ACCESS_KEY=minio-admin' >> /etc/default/minio
sudo echo 'MINIO_SECRET_KEY=minio-admin' >> /etc/default/minio

# install Service
sudo cp /home/vagrant/files-prov/minio/minio.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable minio
sudo systemctl start minio

# create date string
DATE=`date +%Y%m%d%H%M`

# store minio version
MINIO_VERSION=$(minio --version | sed -n 1p | grep minio | awk  '{print $3}' | cut -d'.' -f 2 | cut -d'T' -f 1)
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> minio $MINIO_VERSION  " >> $application_file_path

# store mino client version
MINIO_CLIENT_VERSION=$(mc --version)
echo "> $MINIO_CLIENT_VERSION  " >> $application_file_path


