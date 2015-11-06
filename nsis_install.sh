#!/bin/bash
echo "beginning nsis and pritunl install script"
echo
#old code commented out before pritunl install changed
#sudo add-apt-repository -y ppa:pritunl &&
#echo
#echo "updating repos, and installing pritunl, might take a minute..."
#sudo apt-get -q=2 update &&
#echo
#sudo apt-get upgrade -y &&
#sudo apt-get -q=2 install pritunl nsis unzip -y &&
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.0.list
echo "deb http://repo.pritunl.com/stable/apt trusty main" > /etc/apt/sources.list.d/pritunl.list
echo
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A
apt-get --assume-yes -q=2 update &&
apt-get --assume-yes -q=2 upgrade &&
apt-get --assume-yes -q=2 install pritunl mongodb-org nsis unzip &&
service pritunl start
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

