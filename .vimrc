set nocompatible

" back to pathogen.
execute pathogen#infect()
syntax on
filetype plugin indent on

" build help tags
call pathogen#helptags()

" show line numbers (hybrid)
set number
set relativenumber

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

" theme
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme PaperColor

" kind of a catch-all to get indentation at 2 spaces. having trouble otherwise
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" allow hidden buffers (aka moving away from an edited but yet-unsaved buffer)
set hidden

" better escape
inoremap jk <esc>

" move through buffers
" TODO: improve this
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" cycle through spits
nnoremap ,, <C-w><C-w>

" rspec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>

" vim-extest mappings
map <leader>et :ExTestRunFile<CR>
map <leader>es :ExTestRunCurrentOrLast<CR>

" ruby xunit helpers
function! RunNearestTest()
  execute ":!m " . @% . ":" . line(".")
endfunction

nnoremap <leader>tt :!ruby -Itest %<cr>
nnoremap <leader>ts :call RunNearestTest()<cr>

" search
nnoremap <silent> <Leader>k :Files<CR>

" Abbreviations
ab bp binding.pry
ab teh the

" easy .vimrc editing
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" search
" TODO: is this still needed?
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
map <leader>gc :Gcommit<cr>

" open tabs en masse
map <leader>ta :tab all<cr>

" https://github.com/junegunn/gv.vim.git
nnoremap <leader>gv :GV!<cr>

" include branch name in status line:
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" case insensitive search
set ignorecase

" open current file in TextMate
" TODO: visual block to pbcopy?
nnoremap <leader>ma :!mate %<cr>

" plz don't slow my search down
" TODO: still needed?
set wildignore+=*.beam,*/_build/*,*/node_modules/*

" golang
map <leader>gor :!go run %<cr>
map <leader>gof :!go fmt %<cr>

" HACK: insert the formatted story id
nnoremap <leader>9 :0r !pbid<cr> A

" spellin'
" TODO: fix this
nnoremap <leader>ss :set spell!<CR>

" todos
nnoremap <leader>td :tabe ~/Documents/Text/todo.md<CR>

" rubocop current file
nnoremap <leader>rc :!rubocop %<cr>

" TODO: can't remember what this is for. airline?
set laststatus=2

" line to show where column 80 is
set colorcolumn=80

" make fvf work
set rtp+=/usr/local/opt/fzf

nnoremap <C-f> :A<CR>
