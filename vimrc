" back to pathogen.
execute pathogen#infect()
syntax on
filetype plugin indent on

" build help tags
call pathogen#helptags()

" show line numbers
set number

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" highlight search patterns
set hls 

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
inoremap jj <esc>
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
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "compiler rspec | set makeprg=zeus | make rspec {spec}"

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
