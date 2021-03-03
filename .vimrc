"VIM configuration file

set mouse=a
set number 
set wrap
set ruler
set cul
set spell
let g:tex_indent_brace=0
"set clipboard=unnamed
"cd /media/prasanna/Data/Documents/Latex/

filetype off
set backspace=indent,eol,start

"Previous line mirror after cursor
inoremap <C-k> <Esc>klv$yhjpi

"Next line TeX
autocmd FileType tex imap <C-d> \\<CR>


"Correct Spelling Mistakes
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Ink scape
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

"NERD Tree Toggle
map <F2> :NERDTreeToggle<CR>

set viminfo='999,<9999,s999999
set encoding=utf-8
scriptencoding utf-8

"hi conceal cater mfg=154
set conceallevel=2

"Shows the corresponding line in PDF
map <silent> <F9> :VimtexView<Enter>

call plug#begin()
Plug 'mg979/vim-visual-multi'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'wincent/terminus'

Plug 'KeitaNakamura/tex-conceal.vim'
let g:tex_conceal="ab mg"
Plug 'matze/vim-tex-fold'

Plug 'KeitaNakamura/neodark.vim'

Plug '907th/vim-auto-save'
"let g:auto_save_events = ["Insert Leave", "TextChanged"]
"let g:auto_save = 0
"au group ft_TeX
"  au!
"  au File Type TeX let b:auto_save = 1
"au group E

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'pandysong/ghost-text.vim'

Plug '~/.vim/plugged-manual/vis'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
"Theme
colorscheme neodark
set background=dark
hi conceal ctermbg=NONE

function! SyncTexForward()
let linenumber=line(".")
let colnumber=col(".")
let filename=bufname("%")
let filenamePDF=filename[:-4]."pdf"
let execstr="!Tathra --sync TeX-forward " . linenumber . ":" . colnumber . ":" . filename . " " . filenamePDF . "&>/dev/null &"
exec execstr 
endfunction
nmap  :call SyncTexForward()
