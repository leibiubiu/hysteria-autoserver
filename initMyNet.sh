#!/bin/bash

pid=$$
cleanup() {
	echo -e "\n======"
	echo -e "clean pids:$pid\n======"
	pstree -p $pid | perl -ne "BEGIN{undef \$/} kill 9,\$_ for /\((\d+)\)/g"
}
trap cleanup EXIT

cd `dirname $0`
dir=$PWD
cd - 1>/dev/null 
cd $dir

{
    while [ 1 ]
    do
        run-one /bin/bash $dir/run.cmd
        sleep 20
    done
} &  
sleep 10
{
    while [ 1 ]
    do
        date +"%Y/%m/%d %H:%M:%S"
        (curl -s -x 127.0.0.1:1081 www.google.com 1>/dev/null ) || killall hysteria-linux-armv5 
        echo
        sleep 20
    done
} &  

wait
# ipinfo.io?token=8ff2e739ead801
