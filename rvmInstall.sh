#!/bin/bash

clear

sudo apt-get update

echo "Installing curl"
sudo apt-get install curl -y

echo "Installing RVM and Ruby"
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

sudo \curl -L https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm requirements

rvm install ruby-2.2.2

rvm use ruby --default

cd $HOME

echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> .bashrc

source ~/.bashrc

ruby -v

gem install rails --no-ri --no-rdoc

echo "Installing git"

sudo apt-get install git-core -y

echo "Setting up github SSH KEY *REQURES USER INPUT*"
if [ -f "$HOME/.ssh/id_rsa.pub" ]
then
	echo "file exists"
else
	echo "file does not exist"
	echo "Enter your email address you use for Github"
	read email
	ssh-keygen -t rsa -b 4096 -C "$email"
	ssh-agent -s
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/id_rsa
fi

echo "Installing Oracle Instant Client"

#sudo mkdir -p /opt/oracle

sudo apt-get install aria2 -y

cd /tmp

aria2c http://codelib.pennunited.com/PennUnited_Code_Library/XUbuntu-Oracle-Folder-Structure/repository/archive.zip

sudo unzip XUbuntu-Oracle-Folder-Structure-master-1cb06a80c2128fa0e15eb0c9700c92898e9c8b1f

cd XUbuntu-Oracle-Folder-Structure-master-1cb06a80c2128fa0e15eb0c9700c92898e9c8b1f

sudo cp opt/ / -r

cd /opt/oracle

sudo apt-get install libaio1

cd instantclient_11_2

sudo ln -s libclntsh.so.11.1 libclntsh.so

echo 'export LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2' >> ~/.bashrc

source ~/.bashrc

echo 'Attempting to install ruby-oci8'

gem install ruby-oci8

echo "Attempting to install node version manager"

sudo apt-get install nodejs -y

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

nvm install stable -y

echo "nvm use stable" >> ~/.bashrc

source ~/.bashrc 

node -v && npm -v

echo "Installing Sublime Text Editor 2"

sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y

sudo apt-get update -y

sudo apt-get install sublime-text -y

echo "Installing grunt bower yeoman"

npm install -g yo bower grunt-cli gulp

