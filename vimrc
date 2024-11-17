set nocompatible
set cursorline
set ruler
set listchars=tab:▸\ ,eol:¬
set relativenumber
set number
set list
set noswapfile
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set hidden
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set ignorecase
set wildignore+=*.beam,*/_build/*,*/node_modules/*
set grepprg=ack\ --nogroup\ $*
set colorcolumn=90
set background=dark

syntax on
syntax enable

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

" for light theme:
" set background=light
" colorscheme PaperColor

filetype plugin indent on

let mapleader=" "

inoremap jk <esc>

nnoremap <leader>ss :set spell!<CR>
nnoremap <C-j> :bprev<cr>
nnoremap <C-k> :bnext<cr>
nnoremap <BS> :bd!<CR>
nnoremap ,, <C-w><C-w>
nnoremap <leader>td :e ~/Documents/Text/todo.md<CR>
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>st :call RunNearestSpec()<CR>
nnoremap <leader>rf :!ruby -Itest %<cr>
nnoremap <leader>rt :call RunNearestTest()<cr>
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <C-f> :Ag<CR>
nnoremap <C-c> :Commits<CR>
nnoremap <silent> <Leader>k :Files<CR>

nmap <leader>0 :set list!<CR>

map <leader>gs :Git status<cr>
map <leader>gb :Git blame<cr>
map <leader>gc :Git commit<cr>

ia bp binding.pry
ia lmm λ
ia teh the

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

autocmd Filetype markdown set nonumber
autocmd Filetype markdown set nolist
autocmd BufRead,BufNewFile *.trc set filetype=strace
autocmd BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.nghtml set filetype=html
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby

function! RunNearestTest()
  execute ":!m " . @% . ":" . line(".")
endfunction
