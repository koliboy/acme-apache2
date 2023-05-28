domaindir=$datadir"domains/"
domain_name=$domaindir"$arg1"
cert=$domain_name"/server.cert"

if [ -d "$domain_name" ]; then
    if [ -f "$cert" ]; then
     echo "$arg1 Certificate for this domain already exists,"
     echo "or renew the certificate or delete the certificate and generate the certificate again"
     exit 1
    fi
fi