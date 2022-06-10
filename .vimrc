set nocompatible | " must be first line 

" visual settings
set number
syntax on
set tabstop=4
set autoindent
set smartindent
set expandtab
set softtabstop=4
set cursorline
set mouse=a

" keybinds (general, not plugin)

" no arrow keys for u (at least in normal mode)
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
" tab nav
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>

" vimplug section
call plug#begin('~/.vim/plugged') 

" plugin format is: Plug 'any valid url or github url ending' 
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } | " NERDTree will automatically open
Plug 'christoomey/vim-system-copy'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-easytags'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
Plug 'cakebaker/scss-syntax.vim'
Plug 'xolox/vim-misc'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

" plugin settings section

let g:airline#extensions#tabline#enabled = 1 | " automatically displays all buffers if only 1 tab open
let g:airline_theme='monochrome'             | " Automatically set airline theme

nmap <F8> :TagbarToggle<CR>                  | " Set F8 to toggle tagbar
nmap <F7> :NERDTreeToggle<CR>                | " Set F7 to toggle NERDTree

let g:closetag_filenames = '*.html, *.xhtml, *.phtml'
let g:closetag_xhtml_filenames = '*.xhtml, *.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" au FileType hmtl let b:delimitMate_matchpairs = "(:),[:],{:}" | " This should fix the extra > on html tags but not working
let delimitMate_excluded_ft = "html"                            | " using this to turn of delimitMate on html

"color scheme
colorscheme default
