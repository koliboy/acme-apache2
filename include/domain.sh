domaindir=$datadir"domains/"

domain_name=$domaindir"$arg1"


if [ ! -d "$domaindir" ]; then
 if ! mkdir $domaindir;then
     echo "error>include/domain.sh:mkdir /domains"
    
     exit 1
 fi
fi

if [ ! -d "$domain_name" ]; then
 if ! mkdir $domain_name;then
     echo "error>include/domain.sh:mkdir /domains/hostanmae"
     
     exit 1
 fi
fi