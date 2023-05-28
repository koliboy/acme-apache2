
if [[ -n $arg4 ]]; then  #when sub domains
    if ! python3 $basdir"lib/httpd_check.py" $arg1 $arg6 $arg4;then
     exit 1 
    fi 
else 
    if ! python3 $basdir"lib/httpd_check.py" $arg1 $arg6;then
     exit 1 
    fi 
fi

