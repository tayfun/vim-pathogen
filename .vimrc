runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

autocmd FileType python set commentstring=#\ %s

" Map F7 to toggle NERDTree
nnoremap <silent> <F7> :NERDTreeToggle<CR>
" tell nerdtree to ignore .pyc binary files.
let NERDTreeIgnore=['\.pyc$', '\.pyo$']

if has("unix")
  set backupdir=~/.vim/backupdir
  set dir=~/.vim/backupdir
endif

" This tip is from http://vim.wikia.com/wiki/VimTip294 , it maps C-s to save.
if has("gui_running")
  " If the current buffer has never been saved, it will have no name,
  " call the file browser to save it, otherwise just save it.
  :map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
endif
" Return to insert mode after saving.
imap <c-s> <c-o><c-s>

" We don't want no compatibility with vi
set nocompatible

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

syntax on

" Both are good color schemes.
" colorscheme darkblue
colorscheme solarized
" colorscheme desert 

set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
" Hiding buffers just clutters my environment. Delete them when I don't need
" them.
" set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes) in terminals

" Number of spaces a tab should be.
set tabstop=4
" Number of spaces used for indentation.
set shiftwidth=4
" Use space instead of tabs.
set expandtab
 
set autoread " read open files again when changed outside Vim
set browsedir =current " which directory to use for the file browser
set visualbell " visual bell instead of beeping
filetype plugin indent on
" highlight current line
set cursorline
" Break lines longer than 80. (wrap option only displays it but doesn't insert
" breaks. textwidth option does the insertion automatically).
" set textwidth=80
" Changed my mind, wrap long lines but do not insert breaks.
" linebreak prevents breaking at the middle of a word, textwidth disables the
" maximum line length setting.
set wrap linebreak textwidth=0

" Highlight searched words
set hlsearch

" <Ctrl-b> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-b> :nohl<CR><C-l>

" Stop vim continuing comments.
set formatoptions-=ql

" Make python fold according to the indentation.
set foldmethod=indent
" Set foldlevelstart to a high number so that folds are open by default.
set foldlevelstart=20

" Removes trailing whitespaces when a file is saved.
" See: http://vim.wikia.com/wiki/Remove_unwanted_spaces
" Previously this was done only on Python source files, now everywhere.
" autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" 1. Use gvim's menu to set your desired font.
" 2. After font is rendered, use "set gfn?" to see its name.
" 3. Add that name below to make it default font. Escape space characters.
set gfn=DejaVu\ Sans\ Mono\ 12

" Set wildignore to ignore .pyc and .pyo files.
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.pyc,*.pyo

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

let g:ctrlp_custom_ignore = {
	\ 'dir':  'uploads$\|\.hg$\|\.svn$\|\.git$',
	\ 'file': '\.exe$\|\.so$\|\.dll$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" Disables indentation checks where flakes8 want you to start below
" continuation line from the parenthesis above it.
let g:syntastic_python_checker_args = "--ignore=E128,E126"


let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()
nmap + : LargerFont<CR>
nmap - : SmallerFont<CR>

" Remove menu options so that there's more room for text.
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

" Disable automatic folding of vim-markdown from plasticboy
let g:vim_markdown_folding_disabled=1
