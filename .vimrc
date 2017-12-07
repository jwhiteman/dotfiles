" this screws with line numbers?
"set nocompatible

" back to pathogen.
execute pathogen#infect()
syntax on
filetype plugin indent on

" build help tags
call pathogen#helptags()

" show line numbers (hybrid)
set relativenumber
set number

" easier quitting
nnoremap <C-p> <esc>:q<cr>

" easier tabbing
nnoremap <C-j> :tabp<cr>
nnoremap <C-k> :tabn<cr>

" highlight current line
set cursorline

" show the ruler
set ruler

" Use the same symbols as Textmate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" change mapleader to something less carpal tunnel inducing
let mapleader=","

" Shortcut to rapidly toggle 'set list'
nmap <leader>0 :set list!<CR>

" having said that...let's always show whitespace.
set list!

" Invisitble character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" disable swap files
set noswapfile

" select default colorscheme
syntax enable

" consider changing background to dark if you are operating on another server
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" kind of a catch-all to get indentation at 2 spaces. having trouble otherwise
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" move lines up and down (buggy...needs work)
nnoremap - ddp
nnoremap _ ddkP

" allow hidden buffers (aka moving away from an edited but yet-unsaved buffer)
set hidden

" easy escape (stolen from FDL's .vimrc)
inoremap jk <esc>

" move through buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" easier splits
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s
nnoremap ,, <C-w><C-w>

" rspec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>

" vim-extest mappings
map <leader>et :ExTestRunFile<CR>
map <leader>es :ExTestRunCurrentOrLast<CR>

" Command-T mappings
nnoremap <silent> <Leader>k :CommandT<CR>

" Abbreviations
ab bp binding.pry
ab teh the

" easy .vimrc editing
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" search
set grepprg=ack\ --nogroup\ $*

" nicer formatting for text and md files 
autocmd Filetype markdown set nonumber
autocmd BufRead,BufNewFile *.trc set filetype=strace
autocmd BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.nghtml set filetype=html
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gr :Gread<cr>
map <leader>gw :Gwrite<cr>
map <leader>gd :Gdiff<cr>
map <leader>gc :Gcommit<cr>

" open tabs en masse
map <leader>ta :tab all<cr>

" foldin' - https://github.com/tpope/vim-rails/issues/25
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 
map <leader>lv :loadview<cr>

" https://github.com/junegunn/gv.vim.git
nnoremap <leader>gv :GV<cr>

" include branch name in status line:
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" rails
nnoremap <leader>av :AV<cr>
nnoremap <leader>at :AT<cr>
nnoremap <leader>rv :RV<cr>
nnoremap <leader>rt :RT<cr>

" TODO: run only individual test? switch to `m` ?
nnoremap <leader>tt :!ruby -Itest %<cr>

" case insensitive search
set ignorecase

" open current file in TextMate
nnoremap <leader>ma :!mate %<cr>

" plz don't slow my search down
set wildignore+=*.beam,*/_build/*,*/node_modules/*

" golang
map <leader>gor :!go run %<cr>
map <leader>gof :!go fmt %<cr>

" HACK: insert the formatted story id
nnoremap <leader>9 :0r !bid<cr> A
