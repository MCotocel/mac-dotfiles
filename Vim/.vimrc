"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Must be first line, stops compatibility mode
set nocompatible

" For undo tree
set undofile 
set undodir=~/.vim/undo

set hidden

" Convert tabs to spaces
set expandtab

" Automatically indent lines
set autoindent

" Set tab to 4 spaces
set tabstop=4

" Set tab to 4 spaces
set shiftwidth=5

" Disable automatic file detection
filetype off

" Make backspace key work
set backspace=indent,eol,start

" Auto read when file is changed
set autoread

" Sets cursor to underline when in normal mode
set guicursor+=n-v-r:hor25 guicursor+=c:ver25

" Syntax color highlighting
syntax on

" Wraps text
set wrap

" Always display status line
set laststatus=2

" Matches matching Greater and Less than signs
set matchpairs+=<:>

" Shows line numbers
set number

" Highlights matching search patterns
set hlsearch

" Hides special characters
set nolist

" Sets fold in column
set foldcolumn=3

" Sets 15 lines to the cursor
set so=15

" Ignores case when searching
set ignorecase

" Adds a little margin
set foldcolumn=1

" Opens splits below main pane
set splitbelow

" Enables autosave
let g:auto_save = 1

" Autosaves when text is changed
let g:auto_save_events = ["InsertLeave", "TextChanged"]

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

let g:ale_disable_lsp = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Changes leader key
let mapleader=' '

vmap <leader>y :w !pbcopy<CR><CR>

nnoremap <leader>u :MundoToggle<CR>

" Maps Leader+b to toggle bookmark
nnoremap <leader>b :BookmarkToggle<CR>

" Maps Leader+. to next bookmark
nnoremap <leader>. :BookmarkNext<CR>

" Maps Leader+, to previous bookmark
nnoremap <leader>, :BookmarkPrev<CR>

" Editing notes
nnoremap <leader><leader><leader> :tabnew ~/Documents/MD\ Notes.md<CR>

" Toggles tagbar
nnoremap <leader>t :TagbarToggle <CR>

" Toggles LimeLight
nnoremap <leader>l :Limelight <CR>

"Binds Alt+s to save
nnoremap <M-s> :w<cr>

" Pressing Escape twice exits terminal buffer
tnoremap <silent> <C-[><C-[> <C-\><C-n>

" Binds Alt+q to quit
map <M-q> :q<CR>

" Binds Alt-t to Luatree
nmap <M-t> :LuaTreeToggle<CR>

" Maps Control-M to Minimap Toggle
map <M-m> :MinimapToggle<CR>

" Binds F6 to Goyo
map <F6> :Goyo<CR>

" Toggle spelling
map <F5> :setlocal spell! spelllang=en_us<CR>

" Toggles floating terminal
map <C-M-n> :FloatermToggle<CR>

" Binds Meta-l to redraw screen and remove highlights
nnoremap <silent> <M-l> :nohl<CR><C-l>

" Remaps Scroll up and down
nnoremap <S-k> <C-u>
nnoremap <S-j> <C-d>

let g:VM_maps = {}
let g:VM_maps["Select Cursor Up"] = '<M-C-k>'
let g:VM_maps["Select Cursor Down"] = '<M-C-j>'

" Remaps Tab to choose suggestion Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

imap <M-TAB> <Plug>(coc-snippets-expand)

" Aborts coc autosuggestions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Inserts suggested text when Enter is pressed Coc
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight symbol and references
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Maps Meta+w to close tab
nnoremap <M-w> :bd<CR>

" Maps Control+n to new tab
nnoremap <C-t> :tabnew<CR>

nnoremap <leader><left> :tabp<CR>

nnoremap <leader><right> :tabn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Horizontal and  vertical splits
noremap <C-W>v :vsplit <CR>
noremap <C-W>h :split <CR>

" Window navigation
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l

" Window resizing
noremap <C-h> :vertical resize +5 <CR>
noremap <C-j> :res -5 <CR>
noremap <C-k> :res +5 <CR>
noremap <C-l> :vertical resize -5 <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets up Vundle for extensions
set rtp+=~/.vim/bundle/Vundle.vim

" Plugin start
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                       " Vundle extension manager
Plugin 'neoclide/coc.nvim'                          " Coc for code linting
Plugin 'wakatime/vim-wakatime'                      " Wakatime for measuring how much time is spent in Vim
Plugin 'jiangmiao/auto-pairs'                       " Auto-pairs automatically closes brackets
Plugin 'junegunn/fzf'                               " Fuzzy finder
Plugin 'vim-airline/vim-airline'                    " Statusline for Vim
Plugin 'vim-airline/vim-airline-themes'             " Themes for Vim-airline
Plugin 'mhinz/vim-startify'                         " Nice Vim start screen
Plugin 'arcticicestudio/nord-vim'                   " Nord theme
Plugin 'dracula/vim'                                " Dracula theme
Plugin 'morhetz/gruvbox'                            " Gruvbox theme
Plugin 'ghifarit53/daycula-vim'                     " Daycula theme
Plugin 'joshdick/onedark.vim'                       " OneDark theme
Plugin 'yorickpeterse/vim-paper'                    " Paper theme for Vim
Plugin 'ryuta69/elly.vim'                           " A soft autumn theme for Vim
Plugin 'tpope/vim-fugitive'                         " Git plugin for Vim
Plugin '907th/vim-auto-save'                        " Autosave for Vim
Plugin 'junegunn/goyo.vim'                          " Distraction free Vim
Plugin 'wfxr/minimap.vim'                           " Minimap for Vim
Plugin 'MattesGroeger/vim-bookmarks'                " Bookmarks
Plugin 'ryanoasis/vim-devicons'                     " Icons for Vim
Plugin 'kevinhwang91/rnvimr'                        " Ranger for Vim
Plugin 'voldikss/vim-floaterm'                      " Floating terminal
Plugin 'JamshedVesuna/vim-markdown-preview'         " Preview markdown files
Plugin 'simnalamburt/vim-mundo'                     " Undo tree
Plugin 'mg979/vim-visual-multi'                     " Multiple cursors
Plugin 'wlemuel/vim-tldr'                           " Tldr in Vim
Plugin 'vimwiki/vimwiki'                            " Wiki for Vim
Plugin 'mattn/calendar-vim'                         " Vim calender
Plugin 'RRethy/vim-illuminate'                      " Highlights word under cursor
Plugin 'preservim/tagbar'                           " Vim tagbar
Plugin 'sbdchd/neoformat'                           " A formatter for Vim
Plugin 'kyazdani42/nvim-web-devicons'               " Icons for Neovim
Plugin 'kyazdani42/nvim-tree.lua'                   " A file tree for Neovim
Plugin 'junegunn/limelight.vim'                     " Focus on your code
Plugin 'miyakogi/seiya.vim'                         " Make Vim transparent
Plugin 'honza/vim-snippets'                         " Extra snippets for Vim
Plugin 'nathanaelkane/vim-indent-guides'            " Indent guides for Vim
Plugin 'camspiers/animate.vim'
Plugin 'camspiers/lens.vim'
Plugin 'wsdjeg/notifications.vim'
Plugin 'rhysd/git-messenger.vim'
Plugin 'dense-analysis/ale'

" Plugin end
call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_custom_header =
        \ map(split(system('sh ~/Documents/Vim-Startup'), '\n'), '"". v:val') + ['']

" Vim start screen list
let g:startify_lists = [
        \{'type': 'bookmarks', 'header': ['     Bookmarks']             },
        \{'type': 'commands', 'header': ['      Commands']              },
        \]

" Vim start screen bookmarks
let g:startify_bookmarks = [
        \{'1': '~/.vimrc'},
        \{'2': '~/.zshrc'},
        \{'3': '~/.tmux.conf'},
        \{'4': '~/.config/alacritty/alacritty.yml'},
        \{'5': '~/.hammerspoon/init.lua'},
        \{'6': '~/Documents/MD Notes/'}
        \]

" Vim start screen commands
let g:startify_commands = [
    \ {'h': ['Help', 'help']},
    \ {'n': ['New file', 'new']},
    \ {'i': ['Install plugins', 'PluginInstall']},
    \ {'u': ['Update plugins', 'PluginUpdate']},
    \ {'c': ['Clean plugins', 'PluginClean']},
    \]

" Colorscheme
colorscheme onedark

set termguicolors

" Customize Goyo width
let g:goyo_width = 100

" Vim minimap highlighting
let g:minimap_highlight = 'Keyword'
let g:minimap_width = 7

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Irssi
command Irc FloatermNew irssi
cnoreabbrev irc Irc

" Newsboat
command News FloatermNew newsboat
cnoreabbrev news News

" Htop
command Htop FloatermNew htop
cnoreabbrev htop Htop
