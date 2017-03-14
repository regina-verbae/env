set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Rust support
Plugin 'rust-lang/rust.vim'

call vundle#end()

"" Enable all syntax highlighting and indentation plugins
syntax on
filetype plugin indent on

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set ruler
set expandtab
set linebreak
set number
set paste
set laststatus=2
set hlsearch

"" Opening multiple files
" previous/next file (normal mode)
map <F7> :bn <CR>
map <F8> :bp <CR>
" previous/next file (insert mode)
imap <F7> <esc>:bn <CR>i
imap <F8> <esc>:bp <CR>i

colorscheme mary

autocmd BufNewFile,BufRead *.t set filetype=test
autocmd BufNewFile,BufRead *.t source $VIMRUNTIME/syntax/perl.vim
autocmd BufNewFile,BufRead *.tdy set filetype=perl
autocmd BufNewFile,BufRead *.tdy source $VIMRUNTIME/syntax/perl.vim

"" Set up block commenting in vim
autocmd FileType * let b:comment = "#"
autocmd FileType vim let b:comment = "\""
autocmd FileType rust let b:comment = '\/\/'
nmap <expr> - AddComment()
nmap <expr> _ RemoveComment()
vmap <expr> - AddComment()
vmap <expr> _ RemoveComment()

func AddComment()
    let b:before=@/
    return InsertComment().RestorePatternMatch().":\r"
endfunc

func RemoveComment()
    let b:before=@/
    return ScrapeComment().RestorePatternMatch().":\r"
endfunc

func RestorePatternMatch()
    return ':let @/=b:before'."\r"
endfunc

func InsertComment()
    return ':s/^\(\s*\)/\1'.b:comment." /\r"
endfunc

func ScrapeComment()
    return ':s/^\(\s*\)'.b:comment."\\s\\?/\\1/\r"
endfunc
