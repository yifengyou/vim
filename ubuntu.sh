#!/bin/bash

echo -e "\033[31m安装将花费一定时间，请耐心等待直到安装完成^_^ \033[0m" 
echo -e "\033[31m 1.依赖软件包安装 \033[0m" 

sudo apt-get install -y build-essential vim git cscope ctags vim-gnome ctags xclip astyle python-setuptools python-dev cmake

echo -e "\033[31m 2.Vundle插件安装 \033[0m" 
if ! ls ~/.vim/bundle/Vundle.vim &> /dev/null;then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo -e "\033[31m   Plugin Vundle already in ~/.vim/bundle/Vundle.vim \033[0m" 

fi
echo -e "\033[31m 3.拷贝.vimrc到~/.vimrc\033[0m" 
cp vim-ubuntu   ~/.vimrc

echo -e "\033[31m 4.安装其他插件 \033[0m" 
echo "正在努力为您安装bundle程序"  > youyifeng
echo "安装完毕将自动退出" >> youyifeng
echo "Plugin Valloric/YouCompleteMe 该插件的安装会比较的慢" >> youyifeng
echo "Plugin Valloric/YouCompleteMe 要求 vim 版本高于7.4.1578，否则会报错" >> youyifeng
echo "请耐心等待" >> youyifeng
vim youyifeng -c "BundleInstall" -c "q" -c "q" 
rm youyifeng

echo -e "\033[31m 5.编译配制YouCompleteMe \033[0m" 
python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/

echo -e "\033[31m安装完成,enjoy~~ \033[0m" 

