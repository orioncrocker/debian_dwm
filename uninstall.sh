#!/bin/bash

if [ ! -d "packages" ];
    then
    echo "packages directory doesn't exist, can't uninstall"
    exit
fi

cd packages

cd dwm-6.2
sudo make uninstall
cd ..

cd st-0.8.1
sudo make uninstall
cd ..

cd dmenu-4.9
sudo make uninstall
cd ..

sudo rm -rf dwm*s
sudo rm -rf dmenu*
sudo rm -rf st*
