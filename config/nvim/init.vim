silent! execute pathogen#infect() " for Pathogen

" turn off swap file
set noswapfile

" set the leader to comma
let mapleader=","

set backspace=2 " make backspace work like most other apps

" Turn on that syntax highlighting
syntax on

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

" Setup ctags
set tags=./tags,tags;$HOME

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" Show what mode vim is in
set showmode

" Enable enhanced command-line completion. 
set wildmenu
set wildmode=longest:list,full

" netrw browser settings
let g:netrw_liststyle = 3 
let g:netrw_altv = 1
let g:netrw_banner = 0

" project specific .vimrc files
set exrc 
set secure

set so=7                " start vertical scroll from 7 lines

set background=dark
" colorscheme solarized

"set autochdir 		    " change directory to the current buffer when opening files.
"set cursorline		    " display a line under the cursor 

set nu                  " line numbers
set clipboard=unnamed
set ruler               " show the cursor position all the time
set laststatus=2 	    " always show the status line
set statusline=%f       " Path to the file
set statusline+=%=      " Switch to the right side
set statusline+=%l      " Current line
set statusline+=/       " Separator
set statusline+=%L      " Total lines
" set statusline+=%{fugitive#statusline()} " add git branch to status line via vim-fugitive

set showmatch           " highlight matching brackets
set mat=2               " how many tenths of a second to blink when matching brackets

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set smartcase           " when searching try to be smart about cases 

set backup		
set backupdir^=~/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

set foldcolumn=1
set ai                  " auto indent
set si                  " smart indent
"set wrap               " wrap lines
set viminfo^=%          " remember info about open buffers on close

set pastetoggle=<F10> " stop the crazy indent on paste

augroup filetypes
        autocmd!
        autocmd BufNewFile,BufRead *.gradle setf groovy
augroup END

" to exit insert mode
inoremap § <esc>

if has('mouse')
        set mouse=a
endif

" disable dope keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap h <NOP>
noremap l <NOP>

" ,, to swap between files
nnoremap <leader><leader> <c-^>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" clear search with esc esc
nnoremap <silent> <Esc><Esc> :noh<CR> :call clearmatches()<CR>

" The Silver Searcher - brew install ag - fast search
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
                        \ if line("'\"") > 0 && line("'\"") <= line("$") |
                        \   exe "normal! g`\"" |
                        \ endif

" sort out pasting from GUI
" esp. indenting 
"
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
        set pastetoggle=<Esc>[201~
        set paste
        return ""
endfunction

" vertical line indentation for IndentLine plugin
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

let g:indentLine_setConceal = 0

" tab key - indent if we're at the beginning of a line else do completion.
"function! InsertTabWrapper()
"        let col = col('.') - 1
"        if !col || getline('.')[col - 1] !~ '\k'
"                return "\<tab>"
"        else
"                return "\<c-p>"
"        endif
"endfunction

"inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" open vimrc for editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gb :Gbrowse<cr>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" disable esc
"inoremap <esc> <nop>

" show gundo
nnoremap <leader>u :GundoToggle<CR>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" command line mode - expand %% to dir of current file
" cnoremap <expr> %% expand('%:h').'/'
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" emmet-vim
" 
let g:user_emmet_leader_key = '<leader>e'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" elm-vim
let g:elm_format_autosave = 1

" no jsx extension required for jsx formatting
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUT TO REFERENCE CURRENT FILE'S PATH IN COMMAND LINE MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

