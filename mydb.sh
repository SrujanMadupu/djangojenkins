#! /bin/bash
MYSQL_ROOT_PASSWORD="srujan1729"
MYSQL_DATABASE="dummydb"
MYSQL_ROOT="root"
DATABASE_NAME="jendev"

#mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE}"
mysql_secure_installation<<$MYSQL_ROOT_PASSWORD
echo $? 
mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $DATABASE_NAME"
echo $?
