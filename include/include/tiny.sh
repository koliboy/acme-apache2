acme_dir="$basdir".well-known/acme-challenge/

acme_tiny_py=$basdir"acme-tiny.py"
contact="mail@"$arg1
cert=$domain_name"/server.cert"

if [[ -n $arg5 ]]; then #contact
contact=$arg5
fi



if ! python3 $acme_tiny_py --account-key "$accountkey" --csr "$csr"  --acme-dir $acme_dir > $cert;then
echo "acme-tiny error"
exit 1 
fi

if [[ -n $arg4 ]]; then  #when sub domains
if ! python3 $basdir"lib/conf_crt_httpd.py" $arg1 $arg6 $serverkey $cert $arg4;then
     exit 1 
    fi 

else 
    if ! python3 $basdir"lib/conf_crt_httpd.py" $arg1 $arg6 $serverkey $cert;then
     exit 1 
    fi 
fi

