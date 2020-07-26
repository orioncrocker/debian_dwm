#!/bin/sh

# check if sudo user
if [ "$UID" -ne 0 ]
    then echo "please run this script as sudo"
    exit
fi

cd dwm-6.2
sudo make uninstall
cd ..

cd st-0.8.1
sudo make uninstall
cd ..

cd dmenu-4.9
sudo make uninstall
cd ..

rm -rf dwm*
rm -rf dmenu*
rm -rf st*
