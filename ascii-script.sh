#!/usr/bin/env bash

# This script is referenced in ./Chaptrer-1-Examples/action-03-artwork.yml

sudo apt install -y cowsay 

cowsay -f dragon "I am a Dragon go away!" >> dragon.txt 

grep -i dragon dragon.txt 

cat dragon.txt 

ls -ltra