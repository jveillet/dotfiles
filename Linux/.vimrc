set nocompatible   " be iMproved, required
filetype off       " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" My bundles here:
" original repos on GitHub
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'docker/docker', {'rtp': 'contrib/syntax/vim'}
Plugin 'elzr/vim-json'
Plugin 'inside/vim-search-pulse'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/CursorLineCurrentWindow'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'

filetype plugin indent on
set timeout timeoutlen=500 ttimeoutlen=100

set autoread                    " Set autoread when files changed from outside
set cursorline                  " highlight current line
set encoding=utf-8
set showcmd                     " display incomplete commands
syntax on                       " Enable syntax highlighting
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

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " search are case insensitive....
set smartcase                   " ... unless they contain at least one
set wrapscan

set lcs=tab:▸\ ,trail:·         " Show 'invisible' characters
set list

set hidden                      " Allow buffer hiding

" Remember info about open buffers on close
"set viminfo^=%

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Send more characters for redraws
set ttyfast
" " Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Remember info about open buffers on close
set viminfo^=%

" Set the window title
set icon
auto BufEnter * let &iconstring = "vim " . expand("%:t")

" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" CTRL + N to open a new tab
map <C-n> :tabnew<CR>CR

" Ack.vim mappings
nnoremap <leader>a :Ack

" backups and swap
"set noswapfile
" Do not back up files in the local dir
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" CtrlP ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.bundle/*,node_modules/*

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
let g:syntastic_check_on_open = 0
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

" Use Unix as the standard file type
set ffs=unix

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

set omnifunc=syntaxcomplete#Complete

" filetype mapping
autocmd BufNewFile,BufReadPost *.cls set filetype=java
autocmd BufNewFile,BufReadPost Guardfile set filetype=ruby
autocmd BufNewFile,BufReadPost Gemfile set filetype=ruby
autocmd BufNewFile,BufReadPost *.thor set filetype=ruby

" Autostart NERDTree
autocmd vimenter * NERDTree
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle NERDTree on/off with CTRL+e
nnoremap <C-e> :NERDTreeToggle<CR>

" NerdTree-Git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "•",
    \ "Renamed"   : "→",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "‼",
    \ "Dirty"     : "⌂",
    \ "Clean"     : "~",
    \ "Unknown"   : "?"
    \ }

" Auto open in a tab with NERDTree open
let g:nerdtree_tabs_open_on_gui_startup = 1
" Open NERDTree on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 1
" When switching into a tab, make sure that focus is on the file window, not in
" the NERDTree window.
let g:nerdtree_tabs_focus_on_files = 1
" Ignore files in NERDTree
let NERDTreeIgnore=['\node_modules$']

" Sets whether the cursor line pulses
let g:vim_search_pulse_mode = 'cursor_line'

" Taglist
" Auto update tags list
let Tlist_Auto_Update = 1

" Swagger documentation snippet
:iabbrev summary: summary: 'Returns ...',<return>detail: 'Returns ...',<return>is_array: false,<return>entity: App::Presenter::,<return>http_codes: [<return>  {code: 000, message: 'Message'}<return>],<return>headers: {'XAuthToken' => {description: 'The Bearer Token', required: true}}
