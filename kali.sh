#!/bin/bash

dir=$HOME/pentest/

if [ "$1" == "" ]
then
		echo -e "Use:\n\t$0 <command>"
		echo -e "Ex:\n\t$0 bash"
		echo -e "\t$0 burpsuite"
elif [ "$1" == "bash" ]
then
		sudo docker run --rm -it -v $dir:/resources -v /tmp/.X11-unix/:/tmp/.X11-unix/ --net=host --privileged -e DISPLAY=$DISPLAY kali $1
else
		sudo docker run --rm -v $dir:/resources -v /tmp/.X11-unix/:/tmp/.X11-unix/ --net=host -e DISPLAY=$DISPLAY --privileged -d kali $1 >/dev/null
fi
