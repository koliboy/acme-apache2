if [[ ! -n "$arg3" ]]; then #not commnas --help

if [[ -z $arg1 ]]; then
    echo "Missing argument >--domain exmaple=--domain myhost.com or --help"
    exit 1
fi

if [[ -z $arg2 ]]; then
    echo "Missing argument >--subj min 2 names LIke --subj IN,Rajthan"
    exit 1
fi

if [[ -z $arg6 ]]; then
    echo "Missing argument >--conf apache2,httpd sitesenable (e.g.,) /sdk-srvar/apache2/usr/conf/sites"
    echo "how confi /sdk-srvar/apache2/usr/conf/sites/test.com/test.com.conf "
   echo "/test.com/sub.test.com.conf or sub.test.com/sub.test.com.conf"
    exit 1
fi
fi

