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

" highlight search patterns
" set hls 

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

" easy capitalization
inoremap <c-u> <esc>viWUA
nnoremap <c-u> viWUE

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

" RSpec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>

function! UseZeusForRspecCommand()
  let g:rspec_command = "compiler rspec | set makeprg=zeus | make rspec {spec}"
endfunc

nnoremap <Leader>uz :call UseZeusForRspecCommand()<CR>

function! NoZeusForRspecCommand()
  let g:rspec_command = "!clear && echo rspec {spec} && rspec {spec}"
endfunc

nnoremap <Leader>ur :call NoZeusForRspecCommand()<CR>

" Command-T mappings
nnoremap <silent> <Leader>k :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" Abbreviations
ab bp binding.pry
ab teh the

" set 80-character column
set colorcolumn=80

" easy .vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" search
set grepprg=ack\ --nogroup\ $*

" nicer formatting for text and md files 
autocmd Filetype markdown set nonumber
autocmd BufRead,BufNewFile *.trc set filetype=strace

" killing lines and words while editing
inoremap <C-u> <esc>S
inoremap <C-k> <esc>dawa

" goin full orenstein
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gr :Gread<cr>
map <leader>gw :Gwrite<cr>
map <leader>gl :Glog<cr>
map <leader>gd :Gdiff<cr>
map <leader>gc :Gcommit<cr>

map <leader>ta :tab all<cr>

" foldin'
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

map <leader>za zR<cr>
map <leader>zc zM<cr>
