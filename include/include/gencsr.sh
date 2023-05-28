source "$basdir"include/subj.sh

csr=$domain_name"/server.csr"
domain=$arg1 #domain.com
sub_domains="$arg4" #1.domain.com,2.domain.com
tempdir=$(mktemp -d)
alt_san="$tempdir/""san.cnf"


if [[ -n $sub_domains ]]; then #include sub domains

if ! python3 $basdir"lib/san.py" $sub_domains $alt_san;then
     echo "error>include/gencsr.sh:$alt_san file wite error"
     rm -rf "$tempdir"
     exit 1 
fi 

if ! openssl req -new -key $serverkey -out $csr -subj "/C=$contry_name/ST=$state_name/CN=$domain/L=$localityName/O=$organizationName/OU=$organizationalUnitName" -config $alt_san -extensions v3_req;then 
    echo "error>include/gencsr.sh:gen error"
    rm -rf "$tempdir"
    exit 1
fi

else 
 if !  openssl req -new -key $serverkey -out $csr -subj "/C=$contry_name/ST=$state_name/CN=$domain/L=$localityName/O=$organizationName/OU=$organizationalUnitName";then 
    echo "error>include/gencsr.sh:gen error"
    rm -rf "$tempdir"
    exit 1
 fi

fi
rm -rf "$tempdir"

