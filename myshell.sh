#! /bin/bash
rootpath=/root/home/srujan/dj
yum -y install python36
yum -y install python36-pip
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
md5sum mysql80-community-release-el7-3.noarch.rpm
rpm -ivh mysql80-community-release-el7-3.noarch.rpm
yum -y --nogpgcheck install mysql-server
systemctl start mysqld
python3 -m venv  $rootpath/jenk
source $rootpath/jenk/bin/activate
pip3 install -r $rootpath/requirements.txt
python3 $rootpath/manage.py runserver
deactivate

