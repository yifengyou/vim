
" github.com/yifengyou/vim
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox' 
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/nerdtree'
Plug 'wenlongche/SrcExpl'
Plug 'wesleyche/Trinity'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
call plug#end() 

let mapleader=";"
nnoremap <Leader>q :TlistClose<CR> :SrcExplClose<CR> :NERDTreeClose<CR> :q!<CR> 
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>t :Tlist<CR>
nnoremap <Leader>e :SrcExplToggle<CR>
nnoremap <Leader>s :set nonumber<CR> :set norelativenumber<CR> :set listchars=<CR> :set paste<CR>
nnoremap <Leader>S :set number<CR> :set relativenumber<CR> :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:_,<CR> :set nopaste<CR>

" trinity
autocmd VimEnter * TrinityToggleAll
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
"let g:SrcExpl_updateTagsKey=""
let g:SrcExpl_jumpKey="<ENTER>"
let g:SrcExpl_gobackKey="<SPACE>"
"let g:SrcExpl_nestedAutoCmd=1

" ctrlp
let g:ctrlp_working_path_mode=''
let g:ctrlp_funky_syntax_highlight=1
nnoremap <S-U> :CtrlPFunky<Cr>
nnoremap <S-U><S-U> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


"cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 


colorscheme gruvbox

set clipboard=unnamedplus
set clipboard=unnamed
set nu
set relativenumber
set sw=4
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:_,
set list
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set nofoldenable " 关闭代码折叠

filetype on " 侦测文件类型
filetype plugin on "载入文件类型插件
filetype plugin indent on " 加载vim自带和插件相应的语法和文件类型相关脚本

