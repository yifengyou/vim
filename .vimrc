set tabstop=8 " ts 制表符:设置TAB宽8个空格
set shiftwidth=8 " sw 制表符:自动缩进空白字符个数
set softtabstop=8 " sts 制表符:tab键的一个制表符,如果softtabstop=5,tabstop=4,则tab是1个制表符加1个空格的混合
"set expandtab " et 制表符:将制表符以空格代替,内核代码中不使用该特性

set autoindent  " ai 自动缩进:
set cindent  " ci 自动缩进:
set smartindent " si 自动缩进:

set showmatch " 高亮显示匹配的括号
set number " 行号:设置行号,默认不显示行号
set nocompatible " 关闭与VI兼容,避免不必要的错误

set linebreak " 整词换行
set wrap " 自动换行

set shortmess=atI   " 不显示援助乌干达儿童提示
set showcmd " 状态栏显示输入的命令
set showmode " 状态栏显示vim当前模式
set history=1000 " 历史记录
set ruler " 编辑过程中在右下角显示光标位置的状态行
if has("mouse")
	set mouse=a
endif
set selection=exclusive
set selectmode=mouse,key
set autowrite " 自动保存
set autoread " 自动读取:当文件被改动时自动读取

"set hlsearch " 搜索字符串:高亮显示所有匹配处
set incsearch " 搜索字符串:搜索字符串立即显示匹配点

set confirm " 在处理未保存或只读文件的时候，弹出确认 
 
set t_Co=256 " 启用256色彩显示
set background=dark
if has("syntax")
	syntax on " 启用语法高亮
endif

set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set noerrorbells " 关闭错误信息响铃


" ========================================================================================================
filetype on " 侦测文件类型
filetype plugin on "载入文件类型插件
filetype plugin indent on " 加载vim自带和插件相应的语法和文件类型相关脚本

" ========================================================================================================
set rtp+=~/.vim/bundle/Vundle.vim "vundle安装地址
call vundle#begin() "插件安装地址
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'Yggdroot/indentLine' " 缩进提示
	Plugin 'kien/rainbow_parentheses.vim' " 括号高亮
	Plugin 'jiangmiao/auto-pairs' " 括号补全
	Plugin 'tomasr/molokai'
	Plugin 'Shougo/neocomplete.vim' " 代码补全
	Plugin 'vim-scripts/DoxygenToolkit.vim' " 注释自动生成
	Plugin 'godlygeek/tabular' " 排列文本的插件
	Plugin 'plasticboy/vim-markdown' " markdown语法高亮
	Plugin 'suan/vim-instant-markdown' " markdown实时预览插件   
	Plugin 'scrooloose/nerdcommenter' " python注释插件
	Plugin 'yifengyou/vim-color' " yyf vim 主题
	Plugin 'Valloric/YouCompleteMe' "该插件的安装比较的慢,可先注释掉,后续安装
call vundle#end()

" ========================================================================================================
colorscheme yyf " 设置主题:必须放置本配置文件插件安装之后的位置
" ========================================================================================================

let g:DoxygenToolkit_authorName="cenmmy" " DoxygenToolkit插件在@author区域自动填充的作者名称

" Set mapleader
let mapleader = ","

" ========================================================================================================
map <F5> :call RunPython()<CR> " F5:运行 Python 代码

set pastetoggle=<F9> " F9:粘贴文本避免错乱 

" 选中状态下 Ctrl+c Ctrl+v 复制粘贴
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y

func! RunPython()
	exec "w"
	    if &filetype == 'python'
		exec "!time python3 %"
	    endif
endfunc

" ========================================================================================================
"
"
"
