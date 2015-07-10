#!/bin/bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

gen_pass() {
    MATRIX='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    LENGTH=6
    while [ ${n:=1} -le $LENGTH ]; do
        PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
        let n+=1
    done
    echo "$PASS"
}

#v-add-database USER DATABASE DBUSER DBPASS [TYPE] [HOST] [CHARSET]
USER=$(ls -ld ./ | awk '{print $3}')
DB_NAME=$USER"_"$(gen_pass)


OUT=`"DB_NAME=$DB_NAME
DB_USER=$DB_NAME
DB_PASSWORD=$(gen_pass)$(gen_pass)
DB_HOST=localhost

WP_ENV=development
WP_HOME=http://example.local
WP_SITEURL=http://taradac.local/wp"`


echo $(OUT) > testing.out

#echo /usr/local/vesta/bin/v-add-database $USER $DB_NAME $DB_NAME $DB_PASSWORD



#echo $USER
#echo testing $USER $USER"_"$(gen_pass)$(gen_pass) $(gen_pass)$(gen_pass)
#
#DB_NAME=lenhardt_taradac
#DB_USER=lenhardt_taradac
#DB_PASSWORD=1dgDEBZtoDrkw7ylGBDf
#DB_HOST=localhost
#
#WP_ENV=development
#WP_HOME=http://example.local
#WP_SITEURL=http://example.local/wp
