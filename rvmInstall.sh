#!/bin/bash

clear

sudo apt-get update

echo "Installing curl"
sudo apt-get install curl

echo "Installing RVM and Ruby"
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

sudo \curl -L https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm requirements

rvm install ruby

rvm use ruby --default

cd $HOME

echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> .bashrc

source ~/.bashrc

ruby -v

gem install rails --no-ri --no-rdoc

echo "Installing git"

sudo apt-get install git-core

echo "Installing Oracle Instant Client"

sudo mkdir -p /opt/oracle

cd /tmp

wget http://download.oracle.com/otn/linux/instantclient/11204/instantclient-basic-linux.x64-11.2.0.4.0.zip

wget http://download.oracle.com/otn/linux/instantclient/11204/instantclient-sqlplus-linux.x64-11.2.0.4.0.zip

wget http://download.oracle.com/otn/linux/instantclient/11204/instantclient-sdk-linux.x64-11.2.0.4.0.zip

cd /opt/oracle

sudo unzip /tmp/instantclient-basic-linux.x64-11.2.0.4.0.zip
sudo unzip /tmp/instantclient-sqlplus-linux.x64-11.2.0.4.0.zip
sudo unzip /tmp/instantclient-sdk-linux.x64-11.2.0.4.0.zip

sudo apt-get install libaio1

cd instantclient_11_2

sudo ln -s libclntsh.so.11.1 libclntsh.so

echo "export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2" | sudo tee .bashrc -a 

source ~/.bashrc

echo 'Attempting to install ruby-oci8'

gem install ruby-oci8

echo "Attempting to install node version manager"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

nvm install stable

echo "nvm use stable" | sudo tee .bashrc -a

source ~/.bashrc 

node -v && npm -v

echo "Installing Sublime Text Editor 2"

sudo add-apt-repository ppa:webupd8team/sublime-text-2

sudo apt-get update

sudo apt-get install sublime-text
