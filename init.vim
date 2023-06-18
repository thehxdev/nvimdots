if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" ============================================== "

lua require('themes/tokyonight_theme')
"lua require('themes/onedark_theme')
"lua require('themes/vscode_theme')
lua require('colors')
lua require('plugins')
lua require('gitsignsconf')
lua require('whichkey')
lua require('nvimtree')
lua require('telescope')
lua require('treesitter')
lua require('masoncfg')
lua require('lspconf')
lua require('cmplsp')
lua require('set')
lua require('bufferlineconf')

" ============================================== "
let g:pymode_indent = 1

" space key as leader key
let mapleader = " "

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <S-m> :bdelete<CR>
noremap <S-h> :bprevious<CR>
noremap <S-l> :bnext<CR>
noremap <S-j> :<CR>
"noremap <S-k> :<CR>
noremap <leader>e :NvimTreeToggle<CR>
noremap <leader>t :terminal<CR>
noremap <leader>ll :LspInfo<CR>
noremap <leader>lr :LspRestart<CR>

noremap <leader>hd :%!xxd -g 1<CR>
noremap <leader>hr :%!xxd -r<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" COC.nvim Key bindings
"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
"inoremap <expr> <Return> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

:set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Status
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

"hi NonText guibg=NONE ctermbg=none
"hi Normal guibg=NONE ctermbg=NONE
