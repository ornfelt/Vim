" Note: Skip initialization for vim-tiny or vim-small.  if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim
set rtp+=~/.fzf
"set pythonthreehome=C:\Users\jonas\AppData\Local\Programs\Python\Python39
"set pythondthreell=C:\Users\jonas\AppData\Local\Programs\Python\Python39\DLLs
set pythonthreehome=C:\Users\jonas\AppData\Local\Programs\Python\Python38-32
set pythondthreell=C:\Users\jonas\AppData\Local\Programs\Python\Python38-32\DLLs

filetype plugin indent on
execute pathogen#infect()
set termguicolors
syntax on
syntax enable
set encoding=UTF-8
set number relativenumber
set noerrorbells
set noeb vb t_vb=
set autoread
set wildmenu
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:winpos 80 100
set backspace=indent,eol,start
set lines=48
set columns=210
set tw=206
set nocompatible
set smartindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hls
set ic
set splitright
set t_Co=256
highlight Normal ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=darkblue
set cursorline
set autochdir
set scrolloff=8
"highlight Normal guibg=none
colorscheme hybrid
"some new stuff
set complete+=kspell
set shortmess+=c
set completeopt+=longest,menuone
set completeopt+=preview
let g:jedi#popup_on_dot = 1

"Keybinds
nnoremap <SPACE> <Nop>
let mapleader=" "
"replace from void
noremap P viw"_dP
noremap Y y$

"FZF
nnoremap <M-a> :Files <cr>
nnoremap <M-s> :Files ../..<cr>
nnoremap <M-d> :Files ../../..<cr>
nnoremap <M-w> :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>

"map <F1>
map <F4> <Esc>:set cursorline!<CR>
"map <F5> :call CompileRunGcc()<CR>
map <M-z> :noh<CR>
map <M-x> :call CompileRunGcc()<CR>
map <F6> <Esc>:setlocal spell! spelllang=en_us<CR>
map <F7> <Esc>:setlocal spell! spelllang=sv<CR>

nnoremap <Down> :resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

inoremap <C-a> <Esc>gg"*yG

autocmd FileType html inoremap <i<Tab> <em></em> <Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <b<Tab> <b></b><Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <h1<Tab> <h1></h1><Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <h2<Tab> <h2></h2><Space><++><Esc>>/<<Enter>GNi
autocmd FileType html inoremap <im<Tab> <img></img><Space><++><Esc>/<<Enter>GNi

autocmd FileType java inoremap fore<Tab> for (String s : obj){<Enter><Enter>}<Esc>?obj<Enter>ciw
autocmd FileType java inoremap for<Tab> for(int i = 0; i < val; i++){<Enter><Enter>}<Esc>?val<Enter>ciw
autocmd FileType java inoremap sout<Tab> System.out.println("");<Esc>?""<Enter>li
autocmd FileType java inoremap psvm<Tab> public static void main(String[] args){<Enter><Enter>}<Esc>?{<Enter>o

autocmd FileType cs inoremap sout<Tab> Console.WriteLine("");<Esc>?""<Enter>li
autocmd FileType cs inoremap fore<Tab> for each (object o : obj){<Enter><Enter>}<Esc>?obj<Enter>ciw
autocmd FileType cs inoremap for<Tab> for(int i = 0; i < val; i++){<Enter><Enter>}<Esc>?val<Enter>ciw

autocmd FileType sql inoremap fun<Tab> delimiter //<Enter>create function x ()<Enter>returns int<Enter>no sql<Enter>begin<Enter><Enter><Enter>end //<Enter>delimiter ;<Esc>/x<Enter>GN
autocmd FileType sql inoremap pro<Tab> delimiter //<Enter>create procedure x ()<Enter>begin<Enter><Enter><Enter>end //<Enter>delimiter ;<Esc>/x<Enter>GN
autocmd FileType sql inoremap vie<Tab> create view x as<Enter>select <Esc>/x<Enter>GN

autocmd FileType text inoremap <line<Tab> --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<Enter>
autocmd FileType text inoremap <dot<Tab> •
autocmd FileType text inoremap <date<Tab> <-- <C-R>=strftime("%Y-%m-%d %a")<CR><Esc>A -->

set statusline=
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%#Difftext#
set statusline+=\ %M "track if changes has been made to file
set statusline+=\ %y "show filetype
set statusline+=\ %r "ReadOnly flag
set statusline+=\ %F "show full path to file
set statusline+=%= "right side settings
set statusline+=%#DiffChange#
set statusline+=\ %c:%l/%L "display column and line pos
set statusline+=\ %p%% "display percentage traversed of file

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Better tabbing
vnoremap < <gv
vnoremap > >gv
imap <C-v> <C-r>+

func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!python %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
elseif &filetype == 'cs'
exec "!csc %"
exec "!%:r.exe"
endif
endfunc
