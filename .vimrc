set ts=4

set autoindent  " 自动缩进

set cindent  " C自动缩进

set shiftwidth=4 " 自动缩进空白字符个数

set softtabstop=4 " tab键的一个制表符，如果softtabstop=5,tabstop=4,则tab是1个制表符加1个空格的混合

set tabstop=4 " tab键的空格数

set smartindent

set nu  " 默认设置行号


set nocompatible              " 去除VI一致性,必须

filetype off                  " 必须

set rtp+=~/.vim/bundle/Vundle.vim "vundle安装地址
call vundle#begin() "插件安装地址

   Plugin 'VundleVim/Vundle.vim'
   Plugin 'Yggdroot/indentLine'  " 缩进提示
   Plugin 'kien/rainbow_parentheses.vim'  " 括号高亮:
   Plugin 'jiangmiao/auto-pairs' " 括号补全
   Plugin 'tomasr/molokai'
   Plugin 'Shougo/neocomplete.vim'  " 代码补全
   Plugin 'vim-scripts/DoxygenToolkit.vim' " 注释自动生成
   Plugin 'godlygeek/tabular' " 排列文本的插件
   Plugin 'plasticboy/vim-markdown' " markdown语法高亮
   Plugin 'suan/vim-instant-markdown' " markdown实时预览插件   
   Plugin 'scrooloose/nerdcommenter' " python注释插件
   Plugin 'Valloric/YouCompleteMe' "这个插件的安装会比较的慢,如果嫌弃太慢的话，可以将这个插件注释掉，等有空的时候再装上
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

colorscheme molokai " 设置主题

let g:DoxygenToolkit_authorName="cenmmy" " DoxygenToolkit插件在@author区域自动填充的作者名称

" Set mapleader
let mapleader = ","

map <F5> :call RunPython()<CR>
func! RunPython()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc

