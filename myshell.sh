#! /bin/bash

rootpath=/root/home/srujan/dj
yum -y install python36
yum -y install python36-pip
yum -y install python36-devel

MYSQL_ROOT='root'
MYSQL_ROOT_PASSWORD='Mobigo#123'
MYSQL_DATABASE='djjenkins'
# MySQL Setup
#wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
#md5sum mysql80-community-release-el7-3.noarch.rpm
#rpm -ivh mysql80-community-release-el7-3.noarch.rpm
#yum -y --nogpgcheck install mysql-server
#service mysqld start
echo "starting mysql server"
sleep 5
systemctl start mysqld
tempPassword=`cat /var/log/mysqld.log | grep "temporary password"|rev|cut -d ' ' -f1|rev|sed 's/ //g' | tail -1`
#`cat /var/log/mysqld.log | grep "temporary password"|rev|cut -d: -f1|rev|sed 's/ //g' | tail -1`
echo $tempPassword
#export<<END
#spawn passwd 
#mysql_secure_installation
#expect "Enter password for user root:"
#send $tempPassword\r
#expect "New password:"
#send $MYSQL_ROOT_PASSWORD\r
#expect "Re-enter new password:"  
#send $MYSQL_ROOT_PASSWORD\r
#expect "Change the password for root ?"
#send "N\r"
#expect "Remove anonymous users? (Press y|Y for Yes, any other key for No) :"
#send "Y\r"
#expect "Disallow root login remotely? (Press y|Y for Yes, any other key for No) :"
#send "Y\r"
#expect "Remove test database and access to it? (Press y|Y for Yes, any other key for No) :"
#send "Y\r"
#expect "Reload privilege tables now? (Press y|Y for Yes, any other key for No) :"
#send "Y\r"
#END
echo $?

echo "done with mysql installation and root user setup"
echo "creating database dummy"
mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE"
echo $?
echo "creting virtual environment"
python3 -m venv  $rootpath/jenk
echo $?
echo "Activating virtual env"
source $rootpath/jenk/bin/activate
echo $?
pip3 install -r $rootpath/requirements.txt
python3 $rootpath/manage.py runserver &
deactivate

