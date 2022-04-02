"VIM configuration file

set mouse=a
set number 
set wrap
set ruler
set cul
set spell
set clipboard=unnamed
set noswapfile
set indentexpr=
set backspace=indent,eol,start

"Previous line mirror after cursor
map <C-k> <Esc>klv$yhjpi

"Next line TeX
"autocmd FileType tex imap <C-d> \\<CR>

"Refresh UltiSnips snippets and $MYVIMRC
map <F12> : call UltiSnips#RefreshSnippets() <bar> : source $MYVIMRC <Enter>
"VimtexCompile
map <F3>  :VimtexCompile<Enter>
"VimtexErrors TODO
"map <F10> : |if (&filetype=='tex')| VimtexErrors | else | q | endif

"Correct Spelling Mistakes
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Inkscape
"Note: 'xcolor' and 'import' packages in LaTeX are required
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
noremap <F9> :VimtexView<Enter>

call plug#begin()
Plug 'https://github.com/mg979/vim-visual-multi.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/jceb/vim-orgmode'
Plug 'https://github.com/lervag/vimtex.git'
"Compile upon opening, and cleanup upon closing
 augroup MyVimtex
   au!
   au User VimtexEventInitPost silent call vimtex#compiler#compile()
   au User VimtexEventQuit silent call vimtex#compiler#clean(0)
   au User VimtexEventQuit silent call CloseViewers()
 augroup END
" Close viewers when VimTeX buffers are closed
 function! CloseViewers()
" Close viewers on quit
 if executable('xdotool') && exists('b:vimtex')
 \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
 call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
 endif
 endfunction

    let g:tex_indent_brace=0
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

Plug 'https://github.com/SirVer/ultisnips.git'
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'https://github.com/honza/vim-snippets.git'

Plug 'https://github.com/wincent/terminus.git'

Plug 'https://github.com/KeitaNakamura/tex-conceal.vim.git'
    let g:tex_conceal="abmg"
    hi conceal ctermbg=NONE
    hi Conceal guifg=NONE
    hi Conceal guibg=NONE
Plug 'https://github.com/matze/vim-tex-fold.git'

Plug 'https://github.com/KeitaNakamura/neodark.vim.git'

Plug 'https://github.com/907th/vim-auto-save.git'
"    let g:auto_save_events = ["Insert", "TextChanged"]
"    let g:auto_save = 1
"     augroup ft_tex
"       au!
"       au FileType tex let b:auto_save = 1
"     augroup END

Plug 'https://github.com/vim-pandoc/vim-pandoc.git'
Plug 'https://github.com/vim-pandoc/vim-pandoc-syntax.git'

Plug 'https://github.com/pandysong/ghost-text.vim.git'

Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/flazz/vim-colorschemes'

"Plug 'mattn/emmet-vim'

"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
"Theme
colorscheme neodark
set background=dark

function! SyncTexForward()
    let linenumber=line(".")
    let colnumber=col(".")
    let filename=bufname("%")
    let filenamePDF=filename[:-4]."pdf"
    let execstr="!Tathra --sync TeX-forward " . linenumber . ":" . colnumber . ":" . filename . " " . filenamePDF . "&>/dev/null &"
exec execstr 
endfunction
nmap  :call SyncTexForward()
