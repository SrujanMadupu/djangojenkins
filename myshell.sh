#! /bin/bash
rootpath=/root/home/srujan/dj/
yum -y install python36
yum -y install python36-pip
python3 -m venv  $rootpath/jenk
source $rootpath/jenk/bin/activate
pip3 install -r $rootpath/requirements.txt
python3 manage.py runserver
