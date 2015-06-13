#!/bin/sh

CURR=$(pwd)

# intall xcode command line tools
xcode-select --print-path
RETVAL=$?
if [ $RETVAL -ne 0 ]; then
    echo " * Setting up Developer Tools CLI..."
    xcode-select --install
fi

if [ ! -f /usr/local/bin/brew ]; then
  echo "Installing: brew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Found: brew"
fi

brew install ctags
brew install cmake
brew install macvim --with-lua --override-system-vim

if [ ! -e ~/.vim/temp_dirs/undodir ]; then
    # make vim temp dir
    mkdir -p ~/.vim/temp_dirs/undodir
fi

# link vimrc
rm -rf ~/.vimrc
ln -s ${CURR}/config/vimrc ~/.vimrc

# install neobundle
if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
    echo "Installing: vim/neobundle ..."
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# install vundle
echo "Installing bundles ..."
~/.vim/bundle/neobundle.vim/bin/neoinstall

# install tern's deps
echo "Installing tern deps ..."
cd ~/.vim/bundle/tern_for_vim/
npm i

# compile ycm, TODO: move this to neobundle
cd ~/.vim/bundle/YouCompleteMe
./install.sh

cd ${CURR}

# set mvim as git's default editor
git config --global core.editor "/usr/local/bin/mvim -f"

exit
