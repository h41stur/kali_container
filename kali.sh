#!/bin/bash

dir=$HOME/pentest/
xh=$(sudo xhost | grep LOCAL | wc -l)

if [ $xh -eq 0 ]
then
		sudo xhost +Local:root >/dev/null
fi


if [ "$1" == "" ]
then
		echo -e "Use:\n\t$0 <command>"
		echo -e "Ex:\n\t$0 bash"
		echo -e "\t$0 burpsuite"
elif [ "$1" == "bash" ]
then
		sudo docker run --rm -it -v $dir:/resources -v /tmp/.X11-unix/:/tmp/.X11-unix/ --net=host --privileged -e DISPLAY=$DISPLAY kali $1
elif [ "$1" == "pyserv" ]
then
    sudo docker run --rm -it -v $dir:/resources -v /tmp/.X11-unix/:/tmp/.X11-unix/ --net=host --privileged -e DISPLAY=$DISPLAY kali python3 -m http.server $2
elif [ "$1" == "msf" ]
then
    sudo docker run --rm -it -v $dir:/resources -v /tmp/.X11-unix/:/tmp/.X11-unix/ --net=host --privileged -e DISPLAY=$DISPLAY kali msfconsole
else
		sudo docker run --rm -v $dir:/resources -v /tmp/.X11-unix/:/tmp/.X11-unix/ --net=host -e DISPLAY=$DISPLAY --privileged -d kali $1 >/dev/null
fi
