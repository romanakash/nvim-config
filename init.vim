call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'Yggdroot/indentLine'
Plug 'Konfekt/vim-alias'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'dhruvasagar/vim-zoom'
Plug 'rhysd/vim-clang-format'
call plug#end()

map <C-b> <cmd>CHADopen<CR>

set rtp+=~/.fzf
let g:fzf_layout = {'left': '30%'}

nnoremap <C-f> :Files<CR>

set rnu

set autoindent

" tabs vs spaces
:set expandtab
:set tabstop=4
" change existing chars
:retab
:set shiftwidth=4

nnoremap o o<Esc>
nnoremap O O<Esc>

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" split windows the right way
:set splitright
:set splitbelow

" moving up and down side to side like a rollercoaster
nmap <A-k> :m-2<CR>  
nmap <A-j> :m+1<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" clear search highlights
nnoremap <Leader><space> :noh<cr>

if exists('s:loaded_vimafter')
  silent doautocmd VimAfter VimEnter *
else
  let s:loaded_vimafter = 1
  augroup VimAfter
    autocmd!
    autocmd VimEnter * source ~/.config/nvim/after/init.vim
  augroup END
endif

let g:indentLine_char='▏'

let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'

" show quotes in json
let g:indentLine_setConceal = 0

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-eslint', 'coc-tailwind-intellisense', 'coc-react-refactor']

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <Tab> and <S-Tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" auto import
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" prettier
nmap <leader>f :CocCommand prettier.formatFile<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

" hover
nmap <silent> <S-k> :call CocAction('doHover')<CR>

" react refactor
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

colorscheme iceberg

set termguicolors

let g:lightline = { 'colorscheme': 'icebergDark' }
