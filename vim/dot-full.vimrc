set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
set rtp+=~/.fzf
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/fzf.vim'
Bundle 'tpope/vim-commentary'
Plugin 'reedes/vim-pencil'
Plugin 'fatih/vim-go'
Bundle 'vim-scripts/vis'
Bundle 'sheerun/vim-polyglot'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'indenthtml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'pearofducks/ansible-vim'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/csv.vim'
Plugin 'ledger/vim-ledger'
Plugin 'nathangrigg/vim-beancount'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'sebdah/vim-delve'

" Fold the things
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Kill trailing white space
nnoremap <silent> <F2> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"

" source ~/.base.vimrc

map <C-p> :FZF<CR>
" fzf files
map <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

" Flake8 Config
let g:flake8_show_in_file = 1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-t>"
" let g:UltiSnipsListSnippets="<c-t-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"

" let g:SuperTabDefaultCompletionType = '<C-n>'
"  don't f-with my comments when in python
au! FileType python setl nosmartindent
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
" " let g:UltiSnipsJumpForwardTrigger = "<tab>"
" "" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = '<s-tab>'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" g:UltiSnipsSnippetDirectories
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" We have to turn this stuff back on if we want all of our features.
filetype indent plugin on " Filetype auto-detection
syntax on " Syntax highlighting

" paste mode toggle
set pastetoggle=<F11>

" JavaScript Folding
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

" source ~/.mega.vimrc

" vim-go no fold
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"
let g:goimports = 1 

" ledger
let g:ledger_bin = 'hledger'

" Airline settings
" always show status bar
set laststatus=2
let g:airline_theme='gruvbox'
" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
set background=dark
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

source ~/.mega.vimrc
"set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
"set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
" let g:gruvbox_contrast_light='light'
