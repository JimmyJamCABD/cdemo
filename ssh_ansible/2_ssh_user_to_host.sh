#!/bin/bash 
set -eo pipefail
if [[ $# -ne 2 ]] ; then
	printf "\n\tUsage: %s <user-name> <container-name>\n\n" $0
        exit 1
fi
USER=$1
CNAME=$2
printf "\n\nUser %s attempting to ssh from CLI container to container %s:\n\n" $USER $CNAME 
set -x
docker exec $CNAME service nscd restart
set +x
docker-compose exec cli ssh -i /src/ssh_ansible/id_$USER $USER@$CNAME
