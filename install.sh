#!/bin/bash


# pacman -S ttf-nerd-fonts-symbols-mono

sudo docker build -t kali .
serv=$(sudo xhost | grep LOCAL | wc -l)

if [ $serv -eq 0 ]
then
		sudo xhost +Local:root
fi


mkdir -p $HOME/.prog
cp kali.sh $HOME/.prog
mkdir -p $HOME/pentest

sudo ln -sf $HOME/.prog/kali.sh /usr/bin/kali
