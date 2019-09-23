set t_Co=256
syntax on
filetype plugin indent on
set mouse=a
set number
set hidden
set list
set showcmd
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
colorscheme elflord

if has('unnamedplus')
	set clipboard=unnamedplus
else
	set clipboard=unnamed
endif


func! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunc

func! DeleteTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

command DeleteWhiteSpace execute DeleteTrailingWhitespace()


let s:editor_root=expand('~/.nvim')

let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'

if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	" silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
	silent call mkdir(s:editor_root . '/bundle', "p")
	silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
	let vundle_installed=0
endif

let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'rust-lang/rust.vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'sebastianmarkow/deoplete-rust'
Plugin 'zchee/deoplete-clang'
Plugin 'rhysd/vim-clang-format'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'lambdalisue/suda.vim'
Plugin 'beyondmarc/glsl.vim'
Plugin 'airblade/vim-rooter'
Plugin 'lervag/vimtex'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jceb/vim-orgmode'
Plugin 'Shirk/vim-gas'
Plugin 'junegunn/vim-easy-align'

if vundle_installed == 0
	echo "installing"
	:PluginInstall
endif

" easy align config
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" suda config
let g:suda_smart_edit = 1

" javacomplete2 config
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" asm config
let g:asmsyntax = 'nasm'

" NERDtree config
cmap ne NERDTreeToggle

" syntastic config
let g:syntastic_c_check_header = 1
let g:syntastic_always_populate_loc_list = 1

" deoplete config
let g:deoplete#enable_at_startup = 1

" deoplete <TAB>: completion.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


" rust config
let g:deoplete#sources#rust#racer_binary=Chomp(system('which racer'))
let g:deoplete#sources#rust#rust_source_path=Chomp(system('rustc --print sysroot')) . '/lib/rustlib/src/rust/src'

let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustfmt'

" clang config
let g:deoplete#sources#clang#libclang_path = '/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/lib/clang'
let g:deoplete#sources#clang#flags = ['-x', 'c', '-Wall', '-Wpedantic', '-Weverything']

" command line

command W w
command Wa wa
command Wq wq
command Q q
command Qa qa
command Split split
command Vsplit vsplit

" glorious readline
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

command LeftSplit normal <C-w><Left>
command RightSplit normal <C-w><Right>
command UpSplit normal <C-w><Up>
command DownSplit normal <C-w><Down>

func Ide()
  :NERDTreeToggle
  :RightSplit
  :split
  :DownSplit
  :term
  :UpSplit
endfunc

command Ide execute Ide()
