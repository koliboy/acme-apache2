
serverkey=$datadir"server.key"
accountkey=$datadir"account.key" 

if [ ! -f "$serverkey" ]; then
    if ! openssl genpkey -algorithm RSA -out "$serverkey";then
     echo "error>include/genpkey.sh:server.key not gen" 
     exit 1
    fi
fi

if [ ! -f "$accountkey" ]; then
    if ! openssl genpkey -algorithm RSA -out "$accountkey";then
     echo "error>include/genpkey.sh:account.key not gen"
     exit 1
    fi
fi
