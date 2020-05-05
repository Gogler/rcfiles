call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim', {'do': 'git checkout dictfix'}
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvie/vim-flake8', { 'for': 'python'}
Plug 'davidhalter/jedi-vim', { 'for': 'python'}
call plug#end()

"============ FLAKE 8
let g:flake8_quickfix_location="top"
let g:flake8_quickfix_height=15
"============ CTRL P
nnoremap <F3> :CtrlPTag<CR>
"=================================
"============ SETTINGS
"=================================

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


syntax on

set ff=unix             " Unix-style endings
set lazyredraw          " redraw only when need to.
set cmdheight=2 laststatus=2 showcmd
set nu rnu

filetype indent on      " load filetype-specific indent files
set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab smartindent cindent

set novisualbell        " don't blink

" search settings
set showmatch hlsearch incsearch ignorecase smartcase

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

set nobackup nowritebackup noswapfile

autocmd BufWritePre * :%s/\s\+$//e  "Automatically rmoving all trailing whitespace when :w command

" KEYBINDS
" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %
" select all
map <Leader>a ggVG
" space open/closes folds
nnoremap <space> za
" <Leader>Enter enter new line in normal mode
nnoremap <silent> <Leader><CR> :put=''<CR>
" tab navigation
map <s-l> :tabnext<cr>
map <s-h> :tabprevious<cr>
" clear serach with <Leader>h
noremap <silent><Leader>h :nohls<CR>
noremap <left> :bp<CR>
noremap <right> :bn<CR>
nmap <Down> :m .+1<CR>==
nmap <Up> :m .-2<CR>==
" list all open buffers with Leader b
nmap <leader>b :ls<CR>:buffer<Space>
" Open a Quickfix window for the last searchk
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" use <Leader>] to jump to tag in a vertical split
nnoremap <silent> <Leader>] :let word=expand("<cword>")<CR>:sp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
" use <Leader>] to jump to tag in a tab split
nnoremap <silent><Leader><C-]> :tabnew %<CR>g<C-]>
" use <Leader>gf to go to file in a vertical split
nnoremap <silent> <Leader>gf :botright wincmd f<CR>
map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

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

" Set status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Turn on spell cheking and autoinsert mode when commitign
if has('autocmd')
if has('spell')
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
endif
au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

cnoremap rt !ts b `pwd`/% <CR>
noremap rt !ts b `pwd`/% <CR>
