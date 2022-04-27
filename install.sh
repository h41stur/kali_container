#!/bin/bash

sudo docker build -t kali .

mkdir -p $HOME/.prog
cp kali.sh $HOME/.prog
mkdir -p $HOME/pentest

sudo ln -sf $HOME/.prog/kali.sh /usr/bin/kali
