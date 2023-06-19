#!/bin/bash

if command -v apt >/dev/null 2>&1; then
	sudo apt install -y ctags cscope vim git
elif command -v yum >/dev/null 2>&1; then
	sudo yum install -y ctags cscope vim git
else
	echo " * Error: unknown system. Skip pkg install"
fi

git clone https://github.com/yifengyou/vim.git /tmp/yifengyou-vim.git

if [ $? -ne 0 ]; then
	echo " * Download vim.git failed!Make sure your network is ok"
	exit 1
fi

cd /tmp/yifengyou-vim.git

cp -a vimrc ~/.vimrc
echo " * Install vimrc Success!"

if [ -d ~/.vim ]; then
	mv ~/.vim /tmp/
fi
cp -a vim ~/.vim
echo " * Install plug.vim Success!"

sudo cp -a `readlink -f $0` /bin/update-vim
echo " * Install  Success!"

echo " * All done! Enjoy ~~ " 

