function container_exists() {
    sudo docker ps -a | sed 1d | sed 's/ *$//g' | grep $1\$ > /dev/null
}

function container_id() {
    sudo docker ps | sed 1d | sed 's/ *$//g' | grep $1\$ | awk '{print $1}'
}

function container_running() {
    sudo docker ps | sed 1d | sed 's/ *$//g' | grep $1\$ > /dev/null
}

dockerstopall() {
    sudo docker ps | sed 1d | awk '{print $1}' | xargs sudo docker stop
}

dockerkillall() {
    sudo docker ps | sed 1d | awk '{print $1}' | xargs sudo docker kill
}

dockerrmall() {
    sudo docker ps -a | sed 1d | awk '{print $1}' | xargs sudo docker kill
    sudo docker ps -a | sed 1d | awk '{print $1}' | xargs sudo docker rm
}