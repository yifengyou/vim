#!/bin/bash

echo "Please install ctags by yourself!"
echo "Redhat/CentOS/Rocky: yum install -y ctags cscope"
echo "Debian/Ubuntu: apt-get install -y ctags cscope"
sleep 3

cp vimrc ~/.vimrc -a
echo "Install vimrc Success!"

mkdir -p ~/.vim/autoload/ &> /dev/null || true
cp plug.vim ~/.vim/autoload/plug.vim -a
echo "Install plug.vim Success!"

echo "wait a moment..."
sleep 1
vim -c "PlugInstall" -c "q" -c "q" 
echo "All done! Enjoy ~~ " 

