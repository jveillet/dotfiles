set nocompatible                " choose no compatibility with legacy vi
imap jk <ESC>
filetype off                    " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'vim-scripts/a.vim'
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'edkolev/tmuxline.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-rake'
Bundle 'vim-scripts/taglist.vim'
Bundle 'ngmy/vim-rubocop'
Bundle 'rainerborene/vim-reek'
Bundle 'mileszs/ack.vim'
Bundle 'davidkariuki/sexy-railscasts-256-theme'
Bundle 'benmills/vimux'
Bundle 'godlygeek/tabular'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'skalnik/vim-vroom'
Bundle 'flazz/vim-colorschemes'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'plasticboy/vim-markdown'
Bundle 'docker/docker', {'rtp': 'contrib/syntax/vim' }
Bundle 'tpope/vim-endwise'
Bundle 'tomasr/molokai'
Bundle 'elzr/vim-json'
Plugin 'gmoe/vim-espresso'
Plugin 'jnurmine/Zenburn'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'


filetype plugin indent on     " required!
set encoding=utf-8
set showcmd                     " display incomplete commands
syntax on

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is two spaces
set shiftwidth=2                " two soaces for indentation
set expandtab                   " use spaces not tabs
set number                      " display line numbers
"set relativenumber              " display ealtive line number
set autoindent                  " autoindent
set smartindent                 " smartindent
set backspace=indent,eol,start

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " search are case insensitive....
set smartcase                   " ... unless they contain at least one
set wrapscan
set incsearch                   " Hightlight dynamically as pattern is typed

set lcs=tab:▸\ ,trail:·         " Show 'invisible' characters
set list

set hidden                      " Allow buffer hiding

" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" CTRL + N to open a new tab
map <C-n> :tabnew<CR>

" Ack.vim mappings
" nnoremap <leader>a :Ack
" " RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" " various mappings
" nnoremap <leader>h :noh<CR>    " Removes search hihlights
" map <leader>g mzgg=G`z<CR>    " Reformat the whole file

" " backups and swap
set noswapfile
" Do not back up files in the local dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.bundle/*

" fix colors in terminal
set t_Co=256
set term=xterm-256color
set background=dark
if !has("gui_running")
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
endif

let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

" Airline
set laststatus=2
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1
" Prerequisite: Install powerline patched fonts
let g:airline_powerline_fonts=1

" Fonts
set guifont=Inconsolata\ for\ Powerline:h12

" Powerline config
let g:Powerline_symbols = 'fancy'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" syntastic
let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'rubylint']

" Disable Reek lauching at load/save time
let g:reek_on_loading = 0
set ffs=unix

set omnifunc=syntaxcomplete#Complete

hi MatchParen cterm=none ctermbg=none ctermfg=LightGreen

" filetype mapping
autocmd BufNewFile,BufReadPost *.cls set filetype=java
autocmd BufNewFile,BufReadPost Guardfile set filetype=ruby
autocmd BufNewFile,BufReadPost Gemfile set filetype=ruby

" Autostart NERDTree
autocmd vimenter * NERDTree
" Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto open in a tab with NERDTree open
let g:nerdtree_tabs_open_on_gui_startup = 1
" Open NERDTree on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 1
" When switching into a tab, make sure that focus is on the file window, not in
" the NERDTree window.
let g:nerdtree_tabs_focus_on_files = 1

" Path to editor config (Windows only)
let g:EditorConfig_exec_path ='/cygdrive/c/ProgramData/chocolatey/bin/'

