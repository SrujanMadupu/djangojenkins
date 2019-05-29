#! /bin/bash
MYSQL_ROOT_PASSWORD="ramesh123"
MYSQL_DATABASE="djjenkins"
SQL_ROOT="root"
firstcommit="firstcommit"
secondcommit="secondcommit"

master="m1"
tempbranch="t2"
#mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE}"
expect<<END
spawn passwd $mysql_secure_installation
expect
mysql_secure_installation<<$MYSQL_ROOT_PASSWORD
echo $? 
mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE"
echo $?
