domaindir=$datadir"domains/"
domain_name=$domaindir"$arg1"
cert=$domain_name"/server.cert"

if [ -d "$domain_name" ]; then
    if [ ! -f "$cert" ]; then
     echo "$arg1 Certificate not exists,"
     
     exit 1
     
    fi
else 
echo "$arg1 Certificate not exists,"
exit 1
fi