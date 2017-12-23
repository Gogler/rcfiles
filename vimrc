call plug#begin('~/.config/nvim/plugged')
" IDE like plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar', { 'for': ['sh', 'cpp', 'c', 'python', 'cuda']}
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'

" Themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Auto complete Plugins for cpp c
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'Valloric/YouCompleteMe', { 'for': ['sh', 'cpp', 'c', 'cuda']}

" Python plugins
Plug 'nvie/vim-flake8', { 'for': 'python'}
Plug 'davidhalter/jedi-vim', { 'for': 'python'}

" TeX
Plug 'lervag/vimtex', { 'for': 'tex' }

" Add plugins to &runtimepath
call plug#end()
"============ NERD TREE
map <C-a> :NERDTreeToggle<CR>
"============ EASY ALIGN
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"============ FLAKE 8
let g:flake8_quickfix_location="top"
let g:flake8_quickfix_height=15
"============ JEDI VIM
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
autocmd FileType python setlocal completeopt+=preview
let g:jedi#force_py_version = 2


"============ SOLARIZED
"let g:solarized_termcolors=256
"set t_Co=256
"let g:solarized_termtrans=0
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"set background=dark
"colorscheme solarized
"==============Base16
let base16colorspace=256
colorscheme base16-monokai
set background=dark
syntax enable
"============ AIRLINE
let g:Powerline_symbols = 'fancy'
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "badwolf"
"============ PROMPTLINE
let g:promptline_preset = {
            \'b'    : [ '\u' ],
            \'warn' :	[ promptline#slices#last_exit_code() ],
            \'z'    : [ promptline#slices#vcs_branch() ],
            \'c'    : [ '\w' ]}
"============TAGBAR
nmap <F4> :TagbarToggle<CR>
"============ CTRL P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <F3> :CtrlPTag<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
"==============NERD TREE
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-a> :NERDTreeToggle<CR>

"============ YOUCOMPLETEME
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>
nnoremap <F2> :YcmCompleter GoTo<CR>
set omnifunc=syntaxcomplete#Complete
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_server_python_interpreter = '/usr/bin/python2'

"============ TMUX LINE
"let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
            \'a'    : '#S',
            \'win'  : ['#W'],
            \'cwin' : ['#W',],
            \'y'    : ['%R', '%a', '%Y'],
            \'z'    : '#H'}
"============ VIM MULTIPLE CURSORS
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"============ Vimtex
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_progname = 'nvr'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
            \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
            \ 're!\\hyperref\[[^]]*',
            \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
            \ 're!\\(include(only)?|input){[^}]*',
            \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
            \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
            \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
            \ ]

"=================================
"============ SETTINGS
"=================================
if has("wildmenu")
    set wildmenu
    "set wildmode=list
    " Ignore stuff (for TAB autocompletion)
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

syntax on
set ff=unix             " Unix-style endings
"set lazyredraw          " redraw only when need to.
set showmatch           " highlight matching [{()}]
set hlsearch
set ruler
set cmdheight=2
set laststatus=2
set showcmd
set nu
set rnu

set cursorline          " highlight current line
"set cursorcolumn          " highlight current line

filetype indent on      " load filetype-specific indent files
set shiftwidth=4
set tabstop=4
set softtabstop=4

"set autoindent
set expandtab
set smartindent
set cindent

set novisualbell        " don't blink

" search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase " do case insensitive search...
set smartcase " ...unless capital letters are used

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

set mouse=

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

"autocmd BufWritePre * :%s/\s\+$//e  "Automatically rmoving all trailing whitespace when :w command

" KEYBINDS
" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

" select all
map <Leader>a ggVG

" jk is escape
"inorIemap jk <esc>

" select all
map <Leader>a ggVG

" space open/closes folds
nnoremap <space> za

"map <C-T> :tabnew<CR>

" <Leader>Enter enter new line in normal mode
nnoremap <silent> <Leader><CR> :put=''<CR>

" tab navigation
map <s-l> :tabnext<cr>
map <s-h> :tabprevious<cr>

" save as sudo
cmap w!! w  !sudo tee > /dev/null %

" clear serach with <Leader>h
noremap <silent><Leader>h :nohls<CR>

noremap <left> :bp<CR>
noremap <right> :bn<CR>
" list all open buffers with Leader b
nmap <leader>b :ls<CR>:buffer<Space>

nnoremap <leader>p p
nnoremap <leader>P P

nnoremap p p'[v']=
nnoremap P P'[v']=

" Open a Quickfix window for the last searchk
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" use <Leader>] to jump to tag in a vertical split
nnoremap <silent> <Leader>] :let word=expand("<cword>")<CR>:sp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" use <Leader>] to jump to tag in a tab split
nnoremap <silent><Leader><C-]> :tabnew %<CR>g<C-]>

" use <Leader>gf to go to file in a vertical split
nnoremap <silent> <Leader>gf :botright wincmd f<CR>

map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

nmap <Down> :m .+1<CR>==
nmap <Up> :m .-2<CR>==

" disable Ex visual mode
map Q <nop>

"=================================
"============ Execute current file
"=================================
nnoremap <F5> :call ExecuteFile()<CR>
" Will attempt to execute the current file based on the `&filetype`
" You need to manually map the filetypes you use most commonly to the
" correct shell command.
function! ExecuteFile()
    let filetype_to_command = {
                \   'javascript': 'node',
                \   'coffee': 'coffee',
                \   'python': 'python',
                \   'html': 'open',
                \   'sh': 'sh'
                \ }
    let cmd = get(filetype_to_command, &filetype, &filetype)
    call RunShellCommand(cmd." %s")
endfunction

command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    call setline(1, 'You entered:    ' . a:cmdline)
    call setline(2, 'Expanded Form: ' .expanded_cmdline)
    call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'.  expanded_cmdline
    execute "resize 20"
    setlocal nomodifiable
    1
endfunction


"=================================
"============ autocmd and functions
"=================================
" CLEAN commadn clean all trailing whatespaces
command! CLEAN retab | %s/ \+$//

" absolute line numbers in insert mode, relative otherwise for easy movement
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

" Highlight any trailing whitespaces
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" If there is no plugisn use SuperTab
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

" Higlight the max witdh of text
"if exists('+colorcolumn')
    "set colorcolumn=80
"else
    "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

" Set status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Turn on spell cheking and autoinsert mode when commitign
if has('autocmd')
    if has('spell')
        au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
    endif
    au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

cnoremap rt !ts b `pwd`/% <CR>
