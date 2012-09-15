runtime bundles/tplugin_vim/macros/tplugin.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
filetype on

let g:tex_flavor="latex"
set grepprg=grep\ -nH\ $*

syntax enable
let g:solarized_termtrans=1
set background=light
colorscheme solarized
let g:languagetool_jar=$HOME . '/software/language/LanguageTool.jar'

set nocompatible

set iskeyword+=:
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -pv $*'


let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

set sw=2
au BufNewFile,BufRead *.ldg,*.journal        setf ledger 
set nu

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=utf-8,latin1
endif

"To solve the propleme with vim-latexsuite has with ã and â
imap <buffer> <silent> <M-C> <Plug>Tex_MathCal
imap <buffer> <silent> <M-B> <Plug>Tex_MathBF
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> <M-A>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-E>  <Plug>Tex_InsertItem
"imap <buffer> <silent> <M-e>  <Plug>Tex_InsertItemOnThisLine
imap <buffer> <silent> \c <Plug>Traditional
map <buffer> <silent> é é
map <buffer> <silent> á á
map <buffer> <silent> ã ã
"imap ã <Plug>Tex_MathCal
"imap é <Plug>Traditional
let g:Tex_SmartKeyDot=0
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let g:Imap_UsePlaceHolders = 0
set nocp
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
let g:deplatePrg = "deplate -x -X "
au FileType viki compiler deplate

autocmd BufRead,BufNewFile $HOME/vimwiki/* set filetype=viki
let g:vikiHomePage='~/private/viki/index.viki'

map <C-t><C-t> :VikiTasks!<CR>
map <C-t><C-a> :VikiTasksAlarms<CR>
map <C-t><C-h> :VikiHome<CR>

