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
echo $USER
echo testing $USER $USER"_"$(gen_pass)$(gen_pass) $(gen_pass)$(gen_pass)
#/usr/local/vesta/bin/v-add-database $USER $USER$(gen_pass) $(gen_pass)(genpass)



