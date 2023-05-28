if ! [ "$EUID" -eq 0 ]; then #is sudo
 echo "current user is not super root|sudo error:>include/isroot.sh"
 exit 1

fi