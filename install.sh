#!/bin/bash

if command -v apt >/dev/null 2>&1; then
	sudo apt install -y exuberant-ctags cscope vim git
elif command -v yum >/dev/null 2>&1; then
	sudo yum install -y ctags cscope vim git
else
	echo " * Error: unknown system. Skip pkg install"
fi

GITDIR="/tmp/yifengyou-vim-$RANDOM"
# git config --global url."git@github.com:".insteadOf https://github.com/
git clone https://github.com/yifengyou/vim.git ${GITDIR}
if [ $? -ne 0 ]; then
	echo " * Download vim.git failed!Make sure your network is ok"
	exit 1
else
	echo " * Git clone success!"
fi

cd ${GITDIR}
cp -a vimrc ~/.vimrc
echo " * Install vimrc success!"

if [ -d ~/.vim ]; then
	BACKUPVIM="/tmp/.vim-$RANDOM"
	mv ~/.vim ${BACKUPVIM}
	echo " * Backup .vim to ${BACKUPVIM}"
fi
cp -a vim ~/.vim
echo " * Install vim plugins success!"

sudo cp -a `readlink -f $0` /bin/update-vim
sudo chmod +x /bin/update-vim
echo " * Install update-vim success!"

echo " * All done! Enjoy ٩(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ "
