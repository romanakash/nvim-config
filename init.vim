call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'Yggdroot/indentLine'
Plug 'Konfekt/vim-alias'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
call plug#end()

map <C-b> :NERDTreeToggle<CR>

set rtp+=~/.fzf
let g:fzf_layout = {'left': '30%'}

nnoremap <C-f> :Files<CR>

set rnu

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

" show quotes in json
let g:indentLine_setConceal = 0

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-eslint']

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <Tab> and <S-Tab> to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <S> pumvisible() ? coc#_select_confirm() : "<S>"

" prettier
nmap <leader>f :CocCommand prettier.formatFile<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

colorscheme nord
