" General Leader shortcuts {
  let g:mapleader = ";"
"}
" Package management (vundle) and plugins {
  set nocompatible              " be iMproved, required
  filetype off                  " required
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-abolish'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'KabbAmine/vCoolor.vim'
  Bundle 'SirVer/ultisnips'
  Bundle 'terryma/vim-smooth-scroll'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimfiler.vim'
  Plugin 'dracula/vim'
  Plugin 'EasyMotion'
  Plugin 'bufexplorer.zip'
  Plugin 'VisIncr'
  Plugin 'honza/vim-snippets'
  Plugin 'ctags.vim'
  Plugin 'Tagbar'
  Plugin 'easytags.vim'
  Plugin 'xolox/vim-misc'
  Plugin 'itchyny/calendar.vim'
  Plugin 'OmniCppComplete'
  Plugin 'yuratomo/w3m.vim'
  Plugin 'scala.vim'
  Plugin 'vimwiki'
  "Plugin 'EasyDigraph.vim'
  call vundle#end()            " required
  filetype plugin indent on    " required
"}
" General settings {
  " set color term to 256 colors
  "set t_Co=256
  syntax enable
  set background=dark
  colorscheme desert
  " working directory always where the active buffer is located
  set autochdir
  augroup vimrc_set_working_dir
    au!
    autocmd BufEnter * silent! lcd %:p:h
  augroup end
  set ruler
  set hidden
  if has('gui_running')
    set guioptions-=T
    colorscheme desert
    set guifont=dweep\ Medium\ Semi-Condensed\ 9
    set lines=60 columns=108 linespace=0
  endif
  set number
  set autoindent
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set lazyredraw          " redraw only when we need to.
  set relativenumber
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
  " Move a line of text using ALT+[jk]
  nmap <M-j> mz:m+<cr>`z
  nmap <M-k> mz:m-2<cr>`z
  vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
  set scrolloff=3               " keep at least 3 lines above/below
  " Highlight every other line
   map <leader><Tab> :set hls<CR>/\n.*\n/<CR>
"}
" Syntastic config {
  let g:syntastic_style_error_symbol = '⚡'
  let g:syntastic_error_symbol = '✗'
  " '⚡' '😱' '✗' '➽'
  " other cool characters:
  " ⚑ ⚐ ♒ ⛢ ❕ ❗
  let g:syntastic_warning_symbol = '⚠'
  " This does what it says on the tin. It will check your file on open too, not just on save.
  let g:syntastic_check_on_open=0
  "let g:syntastic_debug=3
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_vim_checkers = ['vint']
"}
" YouCompleteMe (YCM) config {
  " strings will be ignored.
  let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  let g:ycm_register_as_syntastic_checker = 0
  let g:ycm_auto_trigger = 1
"}
" YouCompleteMe (YCM), and UltiSnips config {
  " make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  " better key bindings for UltiSnipsExpandTrigger
  "let g:UltiSnipsExpandTrigger = "<S-tab>"
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:ycm_server_python_interpreter = '/usr/bin/python'
"}
" YCM settings {
  let g:clang_library_path = "/usr/lib64/"
  let g:clang_complete_copen = 0
  let g:clang_hl_errors = 1
  let g:clang_snippets = 1
  let g:clang_snippets_engine = "ultisnips"
  let g:clang_close_preview = 1
  let g:clang_complete_macros = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_use_ultisnips_completer = 1
"}
" vim-airline and vim-powerline settings {
  set laststatus=2
  let g:airline_powerline_fonts = 0
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " unicode symbols
  let g:airline_symbols.crypt = ''
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_theme = 'base16'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#whitespace#enabled = 0
  set noshowmode
  set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/
"}
" CtrlP settings {
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  " ctrlp extensions:
  " CtrlP for filetype
  let g:ctrlp_extensions = ['filetype']
   "silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>
  " Faster searching if 'ag' present
  " The Silver Searcher
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
  " by default <c-p> command open in MRU mode
  let g:ctrlp_cmd = 'CtrlPMRU'
"}
" gundo {
  " toggle gundo
  nnoremap <leader>u :GundoToggle<CR>
"}
" tabular {
  " custom mapping shortcuts
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:<CR>
  vmap <Leader>t: :Tabularize /:<CR>
"}
" Annoyance fixes {
  set visualbell 	" don't beep
  set noerrorbells 	" don't beep
  "  Accidentally hitting unwanted keys in normal mode:
  nnoremap <F1> <nop>
  " lets do the same for insert mode!!!
  inoremap <F1> <nop>
  "  Can't backspace past start of operation:
  set backspace=indent,eol,start
  " one less key to hit every time I want to save a file
  " reopening a file
  if has('autocmd')
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
  " disable continuation of comments to the next line
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
"}
" Editing behaviour {
  set ignorecase                  " needed for smartcase setting to work
  set smartcase                   " ignore case if search pattern is all lowercase,
  set hlsearch                    " highlight search terms
  set incsearch                   " show search matches as you type
  " makes it easy to clear out a search by typing "leader+,"
  nnoremap <leader><space> :noh<cr>
"}
" Folding rules & setting {
  set foldenable                  " enable folding
  set foldcolumn=4                " add a fold column
  set foldmethod=indent           " detect triple-{ style fold markers
  set foldnestmax=10      "deepest fold is 10 levels
  set foldlevel=0
  set foldlevelstart=99
"}
" filetype & encoding {
  " Set utf8 as standard encoding and en_US as the standard language
  set encoding=utf8
  setglobal fileencoding=utf-8  " change default file encoding when writing new files
  " Use Unix as the standard file type
  set ffs=unix,dos,mac
  " File types to setup space indentation:
  augroup vimrc_file_type_indentation
    au!
    autocmd FileType vim setlocal shiftwidth=2 tabstop=2 expandtab
    autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4 shiftround
    autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 expandtab
    autocmd FileType c setlocal shiftwidth=4 tabstop=4 expandtab
    autocmd FileType haskell setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4 shiftround
    autocmd FileType matlab setlocal shiftwidth=4 tabstop=2 expandtab
  augroup end
"}
" NERDTree tabs {
  let g:nerdtree_tabs_open_on_gui_startup = 0
  let g:nerdtree_tabs_open_on_new_tab = 0
  " NERDTree tweaks
  " sets the working directory to the current file's directory:
  autocmd BufEnter * lcd %:p:h
  "map <F1> :NERDTreeToggle %:p:h<CR>
  " open Nerd Tree in folder of file in active buffer
  map <Leader>nt :NERDTreeToggle %:p:h<CR>
  " NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  " some colours for NerdTree {
    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
    call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
    call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
  "}
"}
" Tagbar plugin tweaks {
  nmap <leader>tg :TagbarToggle<CR>
"}
" Custom mappings and command shortcuts {
  " Fast saving
  nmap <leader>w :w!<cr>
  " Map Ctrl+Shift+l to Insert current date and time
  imap <C-S-l> <C-R>=strftime("%d/%m/%Y (%b %d) @ %H:%M")<CR>
  nmap <C-S-l> "=strftime("%d/%m/%Y (%b %d) @ %H:%M")<CR>p
  " Map jk and kj to toggle normal mode 
  " insert mode maps
  imap jk <ESC>
  imap kj <ESC>
  imap jj <ESC>0
  imap kk <ESC>0
  " command mode maps
  cmap jk <ESC>
  cmap kj <ESC>
  " visual mode maps
  vmap jk <ESC>
  vmap kj <ESC>
  " tabnew (:T)
  :command! -nargs=* T tabnew <args>
  command  W w !sudo tee > /dev/null %
  " Shortcut to toggle numbers
  nmap <leader>n :set number!<CR>
  " Shortcut to toggle window switching
  map <leader>l <C-w>
  imap <C-Return> <CR><CR><C-o>k<C-t>
  "set writebackup
  set noswapfile
  set shellslash
  " always show tab bar:
  set showtabline=2
  " clipboard madness:
  set clipboard=unnamed
  " Menu stuff
  set wildmenu
  set wildmode=longest,full
  source $VIMRUNTIME/menu.vim
  " To stop myself using arrows
  function! DontBeAGumme()
      echo "Dont Be A Gummy"
      echo "Use hjkl"
  endfunction
  " map to arrows
  nnoremap <Up> :call DontBeAGumme() <Enter>
  nnoremap <Down> :call DontBeAGumme() <Enter>
  nnoremap <Left> :call DontBeAGumme() <Enter>
  nnoremap <Right> :call DontBeAGumme() <Enter>
  " Navigate properly when lines are wrapped
  nnoremap j gj
  noremap k gk
  " show commands
  set showcmd
  nnoremap <leader>bn :bNext<Enter>
  nnoremap <leader>bd :bdelete<Enter>
  nnoremap <leader>e :enew<Enter>
  nnoremap Q <Esc>
  nnoremap <leader>q :q<Enter>
  nnoremap <leader>Q :q!<Enter>
  inoremap <leader><Tab> <C-x><C-f>
  "configure tags - add additional tags here or comment out not-used ones
  set tags+=~/.vim/tags/cpp
  set tags+=~/.vim/tags/cpp-src2
  set tags+=~/.vim/tags/cpp-src3
  set tags+=~/.vim/tags/cpp-src4
  set tags+=~/.vim/tags/cpp_src/
  set tags+=~/.vim/tags/gl
  set tags+=~/.vim/tags/sdl
  set tags+=/usr/include/
  set tags+=/usr/local/include/
  " build tags of your own project with Ctrl-F12
  map <leader>TB :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  " OmniCppComplete
  let OmniCpp_NamespaceSearch = 1
  let OmniCpp_GlobalScopeSearch = 1
  let OmniCpp_ShowAccess = 1
  let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
  let OmniCpp_MayCompleteDot = 1 " autocomplete after .
  let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
  let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
  let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
  " automatically open and close the popup menu / preview window
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt=menuone,menu,longest,preview
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType c set omnifunc=ccomplete#Complete
  au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
  autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
  autocmd BufRead,BufNewFile *.scala set filetype=scala
  " calender view
  nnoremap <leader>CC :Calendar -view=year<CR>
  " sorry :(
  nnoremap <leader>p :emenu Edit.Paste<CR>
"}
