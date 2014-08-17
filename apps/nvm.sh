#!/bin/sh

if [ ! -d $HOME/.nvm ]; then
    echo "Installing: nvm ..."
    git clone https://github.com/creationix/nvm.git ~/.nvm
else
    echo "Found: nvm"
fi

source ~/.nvm/nvm.sh

# install node
echo "Installing: node 0.10.x"
nvm install 0.10

echo "Installing: node 0.11.x"
nvm install 0.11

nvm use 0.11

echo "set default node version to 0.11.x"
nvm alias default 0.11

exit 0