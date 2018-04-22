" NORMAL MODE: (see :help index)
" C-q - terminal control flow (?) see: https://is.gd/6vW1PO
" C-w - window commands
" C-e - scroll up (chill)
" C-r - redo
" C-t - ctag return
" C-y - scroll down (chill)
" C-u - scroll up (fast)
" C-i - (*) same as tab (?)
" C-o - go to N older entry in jump list (?)
" C-p - original: same as 'k'
"     - original: also for control flow (?)
" C-[ - (*) not used
" C-] - go to tag
"
" C-a - add N to number at/after cursor
" C-s - used for terminal control flow (?)
" C-d - scroll down (fast)
" C-f - [OVERRIDE] :Buffers (vim-fzf)
"       original: scroll N screens forwards
" C-g - (*) display current file name and position
" C-h - (*) same as 'h'
" C-j - [OVERRIDE] :bprev
"     - original: same as 'j'
" C-k - [OVERRIDE] :bnext
"     - original: unused
" C-l - redraw screen
"
" C-z - suspend
" C-x - subtract N to number at/after cursor
" C-c - interrupt current (search) command (?)
" C-v - start blockwise visual mode
" C-b - (*) scroll N screens backwards
" C-n - (*) same as j
" C-m - (*) same as <CR>
" 
" <C-@> (*) not used (aka 2)
" <C-_> (*) not used (aka -)
" <CR> - (*) cursor to the first CHAR N lines lower
" <TAB> - go to N newer entry in jump list (?)
" <BS> - OVERRIDE: :A (rails-vim)
"      - original: same as 'h'
" <Space> - (*) same as 'l'
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

" easier cycling through buffers
nnoremap <C-j> :bprev<cr>
nnoremap <C-k> :bnext<cr>

" highlight current line
set cursorline

" show the ruler
set ruler

" use the same symbols as textmate for tabstops and eols
set listchars=tab:▸\ ,eol:¬

" change mapleader to something less carpal tunnel inducing
let mapleader=" "

" toggle for list
nmap <leader>0 :set list!<CR>

" default to show whitespace
set list

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
colorscheme grayorange
"colorscheme solarized

" kind of a catch-all to get indentation at 2 spaces. having trouble otherwise
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" allow hidden buffers (moving away from an edited but yet-unsaved buffer)
set hidden

" better escape
inoremap jk <esc>

" cycle through spits
nnoremap ,, <C-w><C-w>

" rspec.vim:
" (s)pec (f)ile
" (s)pec (t)est
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>st :call RunNearestSpec()<CR>

" vim-extest:
" (e)lixir (f)ile
" (e)lixir (t)est
map <leader>ef :ExTestRunFile<CR>
map <leader>et :ExTestRunCurrentOrLast<CR>

" ruby xunit:
" (r)uby (f)ile
" (r)uby (t)est
nnoremap <leader>rf :!ruby -Itest %<cr>
nnoremap <leader>rt :call RunNearestTest()<cr>

function! RunNearestTest()
  execute ":!m " . @% . ":" . line(".")
endfunction

" search
nnoremap <silent> <Leader>k :Files<CR>

" Abbreviations
ia bp binding.pry
ia teh the

" easy .vimrc editing
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" search
" TODO: is this still needed?
set grepprg=ack\ --nogroup\ $*

" nicer formatting for text and md files 
autocmd Filetype markdown set nonumber
autocmd Filetype markdown set nolist
autocmd BufRead,BufNewFile *.trc set filetype=strace
autocmd BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.nghtml set filetype=html
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby

" fugitive
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gc :Gcommit<cr>

" include branch name in status line:
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" case insensitive search
set ignorecase

" plz don't slow my search down
" TODO: still needed?
set wildignore+=*.beam,*/_build/*,*/node_modules/*

" HACK: insert the formatted story id
nnoremap <leader>9 :0r !pbid<cr> A

" spellcheck
nnoremap <leader>ss :set spell!<CR>

" todos
nnoremap <leader>td :e ~/Documents/Text/todo.md<CR>
nnoremap <leader>wtd :e ~/Documents/Text/work-todo.md<CR>
nnoremap <leader>le :e ~/Documents/Text/learning.md<CR>

" rubocop cu
nnoremap <leader>rc :!rubocop %<cr>

" line to show where column 80 is
set colorcolumn=80

" make fvf work
set rtp+=/usr/local/opt/fzf

" delete buffer
nnoremap <BS> :bd!<CR>

" rails-vim toggle alternate file (see projections.json)
nnoremap <TAB> :A<CR>

" vim-fzf
nnoremap <C-f> :Buffers<CR>

" FIXME: exit when openssl has exit code other than 0
function EncryptMe()
  let nfile = expand("%") . ".enc"
  let ofile = expand("%")

  execute "!openssl enc -aes-256-cbc -salt -in " . ofile . " -out " . nfile
  :bd!
  execute "!rm " . ofile
  execute ":e " . nfile
endfunction

function DecryptMe()
  let nfile = split(expand("%"), ".enc")[0]
  let ofile = expand("%")

  execute "!openssl enc -d -aes-256-cbc -in " . ofile . " > " . nfile
  :bd!
  execute "!rm " . ofile
  execute ":e " . nfile
endfunction

command ENC call EncryptMe()
command DENC call DecryptMe()
