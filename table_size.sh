#!/bin/sh
#!/bin/bash

#Version :1.0
#Purpose : To check the size of a table
#Author  : Bharath

#set -x

#Config details
mysql_path=$(which mysql)"


if [[ $1 == '' || $2 == '' || $3 == '' ]]; then
echo "\033[1m$(tput setaf 9)\nCommand is wrong ! Syntax is below\n" 

printf "\tsh size.sh dbname table_name host_name\n\n$(tput sgr0)\033[0m"

else

$mysql_path --user=$USER --password --host=$3 -e "select table_name,(data_length+index_length)/(1024*1024*1024) as Total_Size from information_schema.tables where TABLE_SCHEMA='$1' and table_name='$2'" -s -N 


fi
