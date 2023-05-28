csr=$domain_name"/server.csr"

domains=($(openssl x509 -in $cert -noout -text | awk '/X509v3 Subject Alternative Name:/ {getline; gsub(/DNS:|, /,"\n"); print}'))


#sub_dd=$(printf "%s," "${domains[@]}" | sed 's/,$//')
sub_dns=$(IFS=','; echo "${domains[*]}")


if ! python3 $basdir"lib/remove/httpd_check.py" "$arg2" $sub_dns;then
      echo "python error conf-ss files not found"
      exit 1 
fi 


if ! python3 $basdir"lib/remove/removefiles.py" "$arg2" $sub_dns;then
      echo "python error cant'Delete conf.. files"
      exit 1 
fi



