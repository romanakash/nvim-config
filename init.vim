call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'simrat39/symbols-outline.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Konfekt/vim-alias'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'dhruvasagar/vim-zoom'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'cespare/vim-toml'
call plug#end()

map <C-b> <cmd>CHADopen<CR>

nnoremap o o<Esc>
nnoremap O O<Esc>

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Rg<CR>

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

" Switch between tabs easily
nnoremap H gT
nnoremap L gt

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

noremap <C-S-Left>  :-tabmove<cr>
noremap <C-S-Right> :+tabmove<cr>

" split windows the right way
:set splitright
:set splitbelow

" moving up and down side to side like a rollercoaster
nmap <A-k> :m-2<CR>  
nmap <A-j> :m+1<CR>

" clear search highlights
nnoremap <Leader><space> :noh<cr>

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

if exists('s:loaded_vimafter')
  silent doautocmd VimAfter VimEnter *
else
  let s:loaded_vimafter = 1
  augroup VimAfter
    autocmd!
    autocmd VimEnter * source ~/.config/nvim/after/init.vim
  augroup END
endif

" indent-blankline
let g:indentLine_char='⎸'

" show quotes in json
let g:indentLine_setConceal = 1 

let g:indent_blankline_show_current_context = 1


" C-s to surround with tags
inoremap <buffer> <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>i


" TELESCOPE
lua << EOF
require('telescope').setup{
  defaults = {
 }
}
EOF


" Find files using Telescope command-line sugar.
nnoremap <C-f> <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>
nnoremap <C-p> <cmd>Telescope file_browser<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" LSP STUFF

lua << EOF
--javascript/typescript
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyls.setup{}
EOF


" LSP saga

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga()
EOF


" LSP saga shortcuts
" async finder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

" jump diagnostic
nnoremap <silent><leader>j :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent><leader>k :Lspsaga diagnostic_jump_prev<CR>

" hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-s> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" show signature help
nnoremap <silent>gs :Lspsaga signature_help<CR>

" rename
nnoremap <silent>gr :Lspsaga rename<CR>

" preview definition
nnoremap <silent> gd :Lspsaga preview_definition<CR>

" floating terminal
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>


" NVIM COMPE
set completeopt=menuone,noselect
" config
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
    \ 'path': v:true,
    \ 'buffer': v:true,
    \ 'nvim_lsp': v:true,
    \ 'ultisnips': v:true
    \ }

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" navigate completion menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" TREESITTER STUFF
lua << EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"javascript", "typescript", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}
EOF


" SYMBOLS OUTLINE
nnoremap <silent> <A-]> :SymbolsOutline<CR>


" Format vim
nnoremap <silent><leader>f :Format<CR>

lua << EOF
require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
     -- prettierd
           function()
              return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
     end
    },
    typescript = {
     -- prettierd
           function()
              return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
     end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    python = {
      -- autopep8
      function()
        return {
          exe = "",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
  }
})
EOF

" DOGE
let g:doge_mapping='<leader>m'


" Ulti snips
let g:UltiSnipsExpandTrigger='<A-c>'


" Rust tools
lua << EOF

local opts = {
    tools = { -- rust-tools options
        -- automatically set inlay hints (type hints)
        -- There is an issue due to which the hints are not applied on the first
        -- opened file. For now, write to the file to trigger a reapplication of
        -- the hints or just run :RustSetInlayHints.
        -- default: true
        autoSetHints = true,

        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
        -- default: true
        hover_with_actions = true,

        -- These apply to the default RustRunnables command
        runnables = {
            -- whether to use telescope for selection menu or not
            -- default: true
            use_telescope = true

            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- wheter to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7
        },

        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {} -- rust-analyer options
}

require('rust-tools').setup(opts)
require('rust-tools.inlay_hints').set_inlay_hints()
EOF


colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

set termguicolors

highlight NonText guibg=none
highlight Normal guibg=none
