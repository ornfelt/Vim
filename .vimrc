execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on

set encoding=UTF-8
syntax enable
set number relativenumber
set noerrorbells
set noeb vb t_vb=
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
:winpos 100 50
set backspace=indent,eol,start
set lines=47
set columns=210
set nocompatible
set tabstop=4
set softtabstop=4
set expandtab
set hls
set ic
highlight Normal ctermbg = NONE
highlight CursorLine cterm=NONE ctermbg=darkblue
set cursorline!
colorscheme hybrid

map <F4> <Esc>:set cursorline!<CR>
map <F5> <Esc>:!javac %.java
map <F6> <Esc>:setlocal spell! spelllang=en_us<CR>

inoremap <C-a> <Esc>gg"*yG

autocmd FileType html inoremap <i<Tab> <em></em> <Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <b<Tab> <b></b><Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <h1<Tab> <h1></h1><Space><++><Esc>/<<Enter>GNi
autocmd FileType html inoremap <h2<Tab> <h2></h2><Space><++><Esc>>/<<Enter>GNi
autocmd FileType html inoremap <im<Tab> <img></img><Space><++><Esc>/<<Enter>GNi

autocmd FileType java inoremap fore<Tab> for each (object o in objects){<Enter><Enter>}<Esc>/)<Enter>GNo
autocmd FileType java inoremap for<Tab> for(int i = 0; i < value; i++){<Enter><Enter>}<Esc>/)<Enter>GNo
autocmd FileType java inoremap sout<Tab> System.out.println("");<Esc>/""<Enter>GNa

autocmd FileType cs inoremap sout<Tab> Console.WriteLine("");<Esc>/""<Enter>GNa
autocmd FileType cs inoremap fore<Tab> for each (object o in objects){<Enter><Enter>}<Esc>/)<Enter>GNo
autocmd FileType cs inoremap for<Tab> for(int i = 0; i < value; i++){<Enter><Enter>}<Esc>/)<Enter>GNo

autocmd FileType sql inoremap fun<Tab> delimiter //<Enter>create function x ()<Enter>returns int<Enter>no sql<Enter>begin<Enter><Enter><Enter>end //<Enter>delimiter ;<Esc>/x<Enter>GN
autocmd FileType sql inoremap pro<Tab> delimiter //<Enter>create procedure x ()<Enter>begin<Enter><Enter><Enter>end //<Enter>delimiter ;<Esc>/x<Enter>GN
autocmd FileType sql inoremap vie<Tab> create view x as<Enter>select <Esc>/x<Enter>GN

autocmd FileType text inoremap <line<Tab> ----------------------------------------------------------------------------------------------------------------------------------------------------
autocmd FileType text inoremap dot<Tab> 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <C-n> :NERDTreeToggle<CR>
