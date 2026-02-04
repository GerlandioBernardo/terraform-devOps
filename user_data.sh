#!/bin/bash

apt update -y
apt upgrade -y

apt install -y docker.io nginx

systemctl start docker
systemctl enable docker

systemctl start nginx
systemctl enable nginx
