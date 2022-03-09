#!/bin/bash


cp vimrc ~/.vimrc -a
echo "Install vimrc Success!"

mkdir -p ~/.vim/autoload/ &> /dev/null || true
cp plug.vim ~/.vim/autoload/plug.vim -a
echo "Install plug.vim Success!"

echo "wait a moment..."
sleep 1
vim -c "PlugInstall" -c "q" -c "q" 
echo "All done! Enjoy ~~ " 

