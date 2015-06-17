#!/bin/bash
echo "beginning nsis and pritunl install script"
sudo add-apt-repository -y ppa:pritunl &&
echo
echo "updating repos, and installing pritunl, might take a minute..."
sudo apt-get -q=2 update &&
echo
#sudo apt-get upgrade -y &&
sudo apt-get -q=2 install pritunl nsis unzip -y &&
clear
echo "successfully installed software, now installing/configuring Shelllink plugin for nsis"
sleep 4
echo
cd && wget -nv http://nsis.sourceforge.net/mediawiki/images/6/6c/Shelllink.zip &&
unzip -d Shelllink Shelllink.zip &&
sudo cp Shelllink/Unicode/Plugins/ShellLink.dll /usr/share/nsis/Plugins/ &&
rm -fr Shelllink Shelllink.zip
clear
echo "successfully finished install script"

