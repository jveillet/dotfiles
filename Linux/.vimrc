" Vundle ne fonctionne pas sur vi.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle gère vundle, c'est obligatoire.
Bundle 'gmarik/vundle'

filetype plugin indent on

" My bundles here:
"
" original repos on GitHub
Bundle 'vim-scripts/a.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'edkolev/tmuxline.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-rake'
Bundle 'vim-scripts/taglist.vim'
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
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'plasticboy/vim-markdown'
Bundle 'docker/docker', {'rtp': 'contrib/syntax/vim'}
Bundle 'tpope/vim-endwise'
Bundle 'elzr/vim-json'
Bundle 'inside/vim-search-pulse'
Bundle 'gmoe/vim-espresso'
Plugin 'jnurmine/Zenburn'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/CursorLineCurrentWindow'

set encoding=utf-8
set showcmd                     " display incomplete commands
syntax on
syntax enable

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is two spaces
set shiftwidth=2                " two soaces for indentation
set expandtab                   " use spaces not tabs
set number                      " display line numbers
set autoindent                  " autoindent
set smartindent                 " smartindent
set backspace=indent,eol,start
set autoread                    " refresh any unchanged files

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " search are case insensitive....
set smartcase                   " ... unless they contain at least one
set wrapscan
set incsearch                   " Hightlight dynamically as pattern is typed

set lcs=tab:▸\ ,trail:·         " Show 'invisible' characters
set list

set hidden                      " Allow buffer hiding

set cursorline                  " Display cursor

" Send more characters for redraws
set ttyfast
" " Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" CTRL + N to open a new tab
map <C-n> :tabnew<CR>

" Ack.vim mappings
nnoremap <leader>a :Ack
" " various mappings
" nnoremap <leader>h :noh<CR>    " Removes search hihlights
" map <leader>g mzgg=G`z<CR>    " Reformat the whole file

" backups and swap
set noswapfile
" Do not back up files in the local dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" CtrlP ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.bundle/*

" fix colors in terminal
set t_Co=256
set term=xterm-256color
set background=dark

" vim colorscheme
colorscheme monokai

" Airline
set laststatus=2
let g:airline_theme="dark"
let g:airline#extensions#tabline#enabled=1

" Prerequisite: Install powerline patched fonts
let g:airline_powerline_fonts=1
" enable/disable displaying buffers with a single tab (c)
let g:airline#extensions#tabline#show_buffers = 1
"configure whether buffer numbers should be shown
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure how buffer numbers should be formatted with printf()
let g:airline#extensions#tabline#buffer_nr_format = '[%s]'
" configure the minimum number of buffers needed to show the tabline
let g:airline#extensions#tabline#buffer_min_count = 0
" enable/disable displaying tab number in tabs mode
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" configure the minimum number of tabs needed to show the tabline
let g:airline#extensions#tabline#tab_min_count = 0

" Fonts
set guifont=Inconsolata\ for\ Powerline:h12

" Powerline config
let g:Powerline_symbols = 'fancy'

" syntastic
let g:syntastic_ruby_checkers=['mri', 'rubocop', 'rubylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '☹'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set ffs=unix

set omnifunc=syntaxcomplete#Complete

"hi MatchParen cterm=none ctermbg=none ctermfg=LightGreen

" filetype mapping
autocmd BufNewFile,BufReadPost *.cls set filetype=java
autocmd BufNewFile,BufReadPost Guardfile set filetype=ruby
autocmd BufNewFile,BufReadPost Gemfile set filetype=ruby
autocmd BufNewFile,BufReadPost *.thor set filetype=ruby

" Autostart NERDTree
autocmd vimenter * NERDTree
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto open in a tab with NERDTree open
let g:nerdtree_tabs_open_on_gui_startup = 1
" Open NERDTree on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 1
" When switching into a tab, make sure that focus is on the file window, not in
" the NERDTree window.
let g:nerdtree_tabs_focus_on_files = 1

" Sets whether the cursor line pulses
let g:vim_search_pulse_mode = 'cursor_line'

" Taglist
" Auto update tags list
let Tlist_Auto_Update = 1

" Symbols for the tree
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'

