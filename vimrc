" 使用vim自己的键盘模式，避免vi键盘模式的以前版本的一些bug和局限
set nocompatible

" 编码格式为utf-8
set encoding=utf-8

" 语法高亮和文件类型检测
syntax on
filetype on
filetype plugin on

" 显示行号和光标行高亮
set nu
set rnu

" 缩进和Tab键的大小和转换
set cindent " c缩进
set autoindent " 自动缩进
set smartindent " 智能缩进
set tabstop=4 " 一个tab键所占的列数
set shiftwidth=4 " 缩进的列数
set softtabstop=4 " 敲入tab键时实际占有的列数
"set expandtab " linux内核不允许自动将tab键输入转化为相应的空格数
set clipboard=unnamedplus
set clipboard=unnamed
set nofoldenable " 关闭代码折叠

" 搜索和替换的选项
set hlsearch " 高亮搜索结果
set noignorecase " 搜索时忽略大小写
hi Search   cterm=NONE ctermbg=236 ctermfg=NONE

set incsearch " 搜索逐字符高亮
hi Visual cterm=NONE ctermbg=236 ctermfg=NONE
"set cursorline
"hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE

" 显示不可见字符
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣,
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·,
set listchars=tab:\|-,trail:~,extends:>,precedes:<,
set list

" 状态栏和界面的样式
set t_Co=256 " 颜色模式为256色
set laststatus=2 " 显示状态栏

" 显示空字符
let mapleader=";"
nnoremap <Leader>s :set nonumber<CR> :set norelativenumber<CR> :set listchars=<CR> :set paste<CR> :set nolist<CR>
"nnoremap <Leader>S :set number<CR> :set relativenumber<CR> :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·,<CR> :set list<CR> :set nopaste<CR>
"nnoremap <Leader>S :set number<CR> :set relativenumber<CR> :set listchars=tab:\|-,trail:~,extends:>,precedes:<,space:·,<CR> :set list<CR> :set nopaste<CR>
nnoremap <Leader>S :set number<CR> :set relativenumber<CR> :set listchars=tab:\|-,trail:.,extends:>,precedes:<,<CR> :set list<CR> :set nopaste<CR>

filetype on " 侦测文件类型
filetype plugin on "载入文件类型插件
filetype plugin indent on " 加载vim自带和插件相应的语法和文件类型相关脚本

" github.com/yifengyou/vim
call plug#begin('~/.vim/plugged')
"Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/nerdtree'
Plug 'wenlongche/SrcExpl'
Plug 'wesleyche/Trinity'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
call plug#end()

" vim-airline
let g:airline_powerline_fonts = 1 " 使用powerline字体（需要安装）
let g:airline#extensions#tabline#enabled = 1 " 显示tab栏
let g:airline_theme='kolor'

nnoremap <Leader>q :TlistClose<CR> :SrcExplClose<CR> :NERDTreeClose<CR> :q!<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>t :Tlist<CR>
nnoremap <Leader>e :SrcExplToggle<CR>

" trinity
"autocmd VimEnter * TrinityToggleAll
nmap <F9>   :TrinityToggleAll<CR>
"nmap <F9>   :TrinityUpdateWindow<CR> :TrinityToggleAll<CR>
nmap <F10>  :TrinityToggleTagList<CR>
nmap <F11>  :TrinityToggleSourceExplorer<CR>
nmap <F12>  :TrinityToggleNERDTree<CR>
" replace ZZ
nnoremap <S-Z><S-Z> <Esc>:wqa!<CR>

" tlist config
"let Tlist_Use_Right_Window=1
"let Tlist_Exit_OnlyWindow=1
let Tlist_WinHeight=10
let Tlist_WinWidth=40
"let Tlist_Auto_Open=1
"let Tlist_Enable_Fold_Column=0
"let Tlist_Show_One_File=1
"autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" nerdtree config
"let NERDTreeShowHidden=1
"let NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable='►'
let g:NERDTreeDirArrowCollapsible='▼'
"let NERDTreeIgnore=['\.pyc','\~$','\.swp']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:Tlist")) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:SrcExpl")) | q | endif

"" srcExpr
let g:SrcExpl_winHeight=8
"let g:SrcExpl_refreshTime=100
"let g:SrcExpl_gobackKey=""
"let g:SrcExpl_pluginList=[
"        \ "__Tag_List__",
"        \ "_NERD_tree_",
"        \ "Source_Explorer"
"    \ ]
"let g:SrcExpl_searchLocalDef=1
"let g:SrcExpl_isUpdateTags=0
"let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsCmd="cscope -bkq -i cscope.files"
"let g:SrcExpl_updateTagsKey=""
let g:SrcExpl_jumpKey="<ENTER>"
let g:SrcExpl_gobackKey="<SPACE>"
"let g:SrcExpl_nestedAutoCmd=1

" ctrlp
let g:ctrlp_working_path_mode=''
let g:ctrlp_funky_syntax_highlight=1
nnoremap <S-U> :CtrlPFunky<Cr>
nnoremap <S-U><S-U> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" cscope (cscope -Rbq)
if has("cscope")
	set cscopetag
	set csprg=/usr/bin/cscope
	set csto=1 " ctrl+] 优先使用cscope
	set cst " ctrl+] 显示多个匹配项而非近一条
	set nocsverb " 是否显示详细信息
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set cscopequickfix=s-,c-,d-,i-,t-,e-
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	"nmap <;-n> :cnext<CR>
	"nmap <;-b> :cprev<CR>
	"nmap <C-q> :copen<CR>
	"nmap <C-c> :cclose<CR>
endif


nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
vnoremap d "_d
vnoremap dd "_dd
