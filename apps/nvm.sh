#!/bin/sh

if [ ! -d $HOME/.nvm ]; then
    echo "Installing: nvm ..."
    git clone https://github.com/creationix/nvm.git ~/.nvm
else
    echo "Found: nvm"
fi

source ~/.nvm/nvm.sh

# install node
echo "Installing: node 0.12.x"
nvm install 0.12

echo "Installing: iojs"
nvm install iojs

nvm use iojs

echo "set default node version to 0.11.x"
nvm alias default iojs

exit 0
