
IFS=',' read -ra elements <<< "$arg2"



if (( ${#elements[@]} >= 2 ));then
   echo ""
else
echo "Missing --subj >min 2 names e.g., IN,Rajthan,"
echo "--subj IN,Rajthan parment re"
echo "options --subj countryName,state_name,localityName,orgname,organizationalUnitName"
echo "Pattern:C,ST,L,O,OU"
exit 1
fi

contry_name=${elements[0]} #IN max length 2 (C)
state_name=${elements[1]} #ST stateOrProvinceName (ST)
localityName='null' #L localityName: Specifies the locality or city name
organizationName='null' #O or organizationName: Specifies the organization or company name.
organizationalUnitName='null' #OU rganizationalUnitName: Specifies the organizational unit or department name.

if (( ${#contry_name} !=2 ));then
  echo "confg Missing --subj"
  echo "(c) countryName: max 2 length under e.g.,(IN) india --subj IN"
  exit 1
fi

if [[ "${elements[2]+isset}" ]]; then
localityName="${elements[2]}"
fi

if [[ "${elements[3]+isset}" ]]; then
organizationName="${elements[2]}"
fi
if [[ "${elements[3]+isset}" ]]; then
organizationalUnitName="${elements[2]}"
fi
