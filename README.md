## ubuntu-18.04-minio
Vagrant Box with Ubuntu 18.04 & [MinIO](https://min.io/)

#### Base image
Used base image [elegoev/ubuntu-18.04](https://app.vagrantup.com/elegoev/boxes/ubuntu-18.04)

#### Automatic provisioning
The base image is provisioned with bash script [ubuntu-18.04-minio.sh](https://github.com/elegoev/vagrant-ubuntu/blob/master/vagrant-ubuntu1804-minio/provisioning/ubuntu-18.04-minio.sh)

#### References
  - [Install Minio on Ubuntu 18.04 LTS](https://linuxhint.com/install_minio_ubuntu_1804)
  - [Minio Quickstart Guide](https://docs.min.io/docs/minio-quickstart-guide)


#### Host Access
| Application          | URL                            | Access Key / Secret Key        |
|----------------------|--------------------------------|--------------------------------|
| Minio Server         | http://minio.localtest.me:9000 | minio-admin / minio-admin      |
