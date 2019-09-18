set nocompatible              " be iMproved, required
filetype off                  " required

" Vim-plug
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
"Plug 'sillybun/autoformatpythonstatement'
Plug 'vim-scripts/indentpython.vim'
Plug 'lervag/vimtex'
Plug 'vim-python/python-syntax'
Plug 'notpratheek/Pychimp-vim'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'ap/vim-css-color'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'enricobacis/vim-airline-clock'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar' 
Plug 'Yggdroot/indentLine'
Plug 'kristijanhusak/defx-icons'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tell-k/vim-autopep8'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'luochen1990/rainbow'
call plug#end()
"set hlsearch
syntax enable
filetype on
set incsearch
let mapleader = "\<Space>"
set number
set relativenumber
set encoding=utf-8
set autoindent
set smartindent
set scrolloff=4
set showmatch
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
au Filetype markdown set tabstop=4
au Filetype markdown set softtabstop=4
au Filetype markdown set shiftwidth=4
au Filetype markdown set expandtab
au Filetype markdown set autoindent
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
let python_highlight_all = 1
let g:rainbow_active = 1
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map Y y$
set laststatus=2
set termguicolors
colorscheme gruvbox
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#clock#auto = 0
set foldmethod=indent
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_a])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
call airline#parts#define_accent('clock', 'bold')
" YCM config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
autocmd Filetype python,c,cpp,Java,vim nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_max_num_candidates = 5
let g:ycm_complete_in_strings=1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "python": 1,
			\ "Java": 1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "vim":1,
			\ }
" defx config
nnoremap <F2> :Defx<CR>
call defx#custom#option('_', {
      \ 'columns': 'indent:git:icons:filename',
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    nmap <silent><buffer><expr> t defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
    nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> r
      \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> T
	  \ defx#do_action('cd', '..')
    nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
endfunction
nmap <F12> :TagbarToggle<CR>
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''
let g:elite_mode=1
set backspace=indent,eol,start
" AutoPep8
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F10> :call Autopep8()<CR>
autocmd Filetype markdown noremap <buffer> <F10> :MarkdownPreview <CR>
let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" set tagbar sort by order of appearance in default
let g:tagbar_sort = 0
let g:tagbar_width = 30
"augroup AutoSaveFolds
  "autocmd!
  "autocmd BufWinLeave * mkview
  "autocmd BufWinEnter * silent loadview
"augroup END
let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer
    \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
