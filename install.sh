#!/bin/bash


if ! cat ~/.vimrc | grep "github.com/yifengyou/bash" > /dev/null ; then
	cp vimrc ~/.vimrc -a
	echo "Install vimrc Success!"
else
	echo "Already installed vimrc!"
fi

echo "wait a moment..."
vim -c "PlugInstall" -c "q" -c "q" 
echo "All done! Enjoy ~~ " 

