#!/usr/bin/env bash

sudo apt install -y cowsay 

cowsay -f dragon "I am a Dragon go away!" >> dragon.txt 

grep -i dragon dragon.txt 

cat dragon.txt 

ls -ltra