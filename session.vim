let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <S-Tab> 	
map! <D-v> *
map  :cprevious
map  :cnext
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>(go-iferr) :call go#iferr#Generate()
nnoremap <silent> <Plug>(go-alternate-split) :call go#alternate#Switch(0, "split")
nnoremap <silent> <Plug>(go-alternate-vertical) :call go#alternate#Switch(0, "vsplit")
nnoremap <silent> <Plug>(go-alternate-edit) :call go#alternate#Switch(0, "edit")
nnoremap <silent> <Plug>(go-vet) :call go#lint#Vet(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-lint) :call go#lint#Golint(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-metalinter) :call go#lint#Gometa(!g:go_jump_to_error, 0)
nnoremap <silent> <Plug>(go-doc-browser) :call go#doc#OpenBrowser()
nnoremap <silent> <Plug>(go-doc-split) :call go#doc#Open("new", "split")
nnoremap <silent> <Plug>(go-doc-vertical) :call go#doc#Open("vnew", "vsplit")
nnoremap <silent> <Plug>(go-doc-tab) :call go#doc#Open("tabnew", "tabe")
nnoremap <silent> <Plug>(go-doc) :call go#doc#Open("new", "split")
nnoremap <silent> <Plug>(go-def-stack-clear) :call go#def#StackClear()
nnoremap <silent> <Plug>(go-def-stack) :call go#def#Stack()
nnoremap <silent> <Plug>(go-def-pop) :call go#def#StackPop()
nnoremap <silent> <Plug>(go-def-type-tab) :call go#def#Jump("tab", 1)
nnoremap <silent> <Plug>(go-def-type-split) :call go#def#Jump("split", 1)
nnoremap <silent> <Plug>(go-def-type-vertical) :call go#def#Jump("vsplit", 1)
nnoremap <silent> <Plug>(go-def-type) :call go#def#Jump('', 1)
nnoremap <silent> <Plug>(go-def-tab) :call go#def#Jump("tab", 0)
nnoremap <silent> <Plug>(go-def-split) :call go#def#Jump("split", 0)
nnoremap <silent> <Plug>(go-def-vertical) :call go#def#Jump("vsplit", 0)
nnoremap <silent> <Plug>(go-def) :call go#def#Jump('', 0)
nnoremap <silent> <Plug>(go-decls-dir) :call go#decls#Decls(1, '')
nnoremap <silent> <Plug>(go-decls) :call go#decls#Decls(0, '')
nnoremap <silent> <Plug>(go-rename) :call go#rename#Rename(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-sameids-toggle) :call go#guru#ToggleSameIds()
nnoremap <silent> <Plug>(go-whicherrs) :call go#guru#Whicherrs(-1)
nnoremap <silent> <Plug>(go-pointsto) :call go#guru#PointsTo(-1)
nnoremap <silent> <Plug>(go-sameids) :call go#guru#SameIds(1)
nnoremap <silent> <Plug>(go-referrers) :call go#guru#Referrers(-1)
nnoremap <silent> <Plug>(go-channelpeers) :call go#guru#ChannelPeers(-1)
xnoremap <silent> <Plug>(go-freevars) :call go#guru#Freevars(0)
nnoremap <silent> <Plug>(go-callstack) :call go#guru#Callstack(-1)
nnoremap <silent> <Plug>(go-describe) :call go#guru#Describe(-1)
nnoremap <silent> <Plug>(go-callers) :call go#guru#Callers(-1)
nnoremap <silent> <Plug>(go-callees) :call go#guru#Callees(-1)
nnoremap <silent> <Plug>(go-implements) :call go#guru#Implements(-1)
nnoremap <silent> <Plug>(go-imports) :call go#fmt#Format(1)
nnoremap <silent> <Plug>(go-import) :call go#import#SwitchImport(1, '', expand('<cword>'), '')
nnoremap <silent> <Plug>(go-info) :call go#tool#Info(1)
nnoremap <silent> <Plug>(go-deps) :call go#tool#Deps()
nnoremap <silent> <Plug>(go-files) :call go#tool#Files()
nnoremap <silent> <Plug>(go-coverage-browser) :call go#coverage#Browser(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-coverage-toggle) :call go#coverage#BufferToggle(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-coverage-clear) :call go#coverage#Clear()
nnoremap <silent> <Plug>(go-coverage) :call go#coverage#Buffer(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-test-compile) :call go#test#Test(!g:go_jump_to_error, 1)
nnoremap <silent> <Plug>(go-test-func) :call go#test#Func(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-test) :call go#test#Test(!g:go_jump_to_error, 0)
nnoremap <silent> <Plug>(go-install) :call go#cmd#Install(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-generate) :call go#cmd#Generate(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-build) :call go#cmd#Build(!g:go_jump_to_error)
nnoremap <silent> <Plug>(go-run) :call go#cmd#Run(!g:go_jump_to_error)
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
vmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
let &cpo=s:cpo_save
unlet s:cpo_save
set autowrite
set backspace=indent,eol,start
set errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
set expandtab
set helplang=en
set runtimepath=~/.vim,~/.vim/pack/plugins/start/vim-javascript,~/.vim/pack/plugins/start/vim-go,~/.vim/pack/plugins/start/typescript-vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim81,~/.vim/pack/plugins/start/vim-javascript/after,/usr/local/share/vim/vimfiles/after,~/.vim/after
set shiftwidth=2
set tabstop=2
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/go/src/github.com/amissine/stellar_kelp_examples
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd Makefile
set stal=2
tabnew
tabnew
tabnew
tabnew
tabnew
tabrewind
edit Makefile
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:#\ -,mO:#\ \ ,b:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'make'
setlocal filetype=make
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*include
setlocal includeexpr=
setlocal indentexpr=GetMakeIndent()
setlocal indentkeys=!^F,o,O,<:>,=else,=endif
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'make'
setlocal syntax=make
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
29
normal! zo
36
normal! zo
39
normal! zo
let s:l = 19 - ((18 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 0
tabnext
edit cmd/root.go
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 30 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
argglobal
nnoremap <buffer> <silent>  :call go#def#StackPop(v:count1)
nnoremap <buffer> <silent> ] :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :GoDef
nnoremap <buffer> <silent> K :GoDoc
xnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('v', 'prev')
onoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('o', 'prev')
nnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('n', 'prev')
xnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('v', 'next')
onoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('o', 'next')
nnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('n', 'next')
xnoremap <buffer> <silent> ac :call go#textobj#Comment('a')
onoremap <buffer> <silent> ac :call go#textobj#Comment('a')
xnoremap <buffer> <silent> af :call go#textobj#Function('a')
onoremap <buffer> <silent> af :call go#textobj#Function('a')
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef
nnoremap <buffer> <silent> gd :GoDef
xnoremap <buffer> <silent> ic :call go#textobj#Comment('i')
onoremap <buffer> <silent> ic :call go#textobj#Comment('i')
xnoremap <buffer> <silent> if :call go#textobj#Function('i')
onoremap <buffer> <silent> if :call go#textobj#Function('i')
nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,0=},0=)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=make
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=go#complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 11 - ((10 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 042|
lcd ~/go/src/github.com/amissine/stellar_kelp_examples
wincmd w
argglobal
if bufexists("~/go/src/github.com/amissine/stellar_kelp_examples/main.go") | buffer ~/go/src/github.com/amissine/stellar_kelp_examples/main.go | else | edit ~/go/src/github.com/amissine/stellar_kelp_examples/main.go | endif
nnoremap <buffer> <silent>  :call go#def#StackPop(v:count1)
nnoremap <buffer> <silent> ] :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :GoDef
nnoremap <buffer> <silent> K :GoDoc
xnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('v', 'prev')
onoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('o', 'prev')
nnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('n', 'prev')
xnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('v', 'next')
onoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('o', 'next')
nnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('n', 'next')
xnoremap <buffer> <silent> ac :call go#textobj#Comment('a')
onoremap <buffer> <silent> ac :call go#textobj#Comment('a')
xnoremap <buffer> <silent> af :call go#textobj#Function('a')
onoremap <buffer> <silent> af :call go#textobj#Function('a')
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef
nnoremap <buffer> <silent> gd :GoDef
xnoremap <buffer> <silent> ic :call go#textobj#Comment('i')
onoremap <buffer> <silent> ic :call go#textobj#Comment('i')
xnoremap <buffer> <silent> if :call go#textobj#Function('i')
onoremap <buffer> <silent> if :call go#textobj#Function('i')
nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,0=},0=)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=make
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=go#complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 14 - ((13 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 30 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
tabnext
edit ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/addaccount.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent>  :call go#def#StackPop(v:count1)
nnoremap <buffer> <silent> ] :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :GoDef
nnoremap <buffer> <silent> K :GoDoc
xnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('v', 'prev')
onoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('o', 'prev')
nnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('n', 'prev')
xnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('v', 'next')
onoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('o', 'next')
nnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('n', 'next')
xnoremap <buffer> <silent> ac :call go#textobj#Comment('a')
onoremap <buffer> <silent> ac :call go#textobj#Comment('a')
xnoremap <buffer> <silent> af :call go#textobj#Function('a')
onoremap <buffer> <silent> af :call go#textobj#Function('a')
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef
nnoremap <buffer> <silent> gd :GoDef
xnoremap <buffer> <silent> ic :call go#textobj#Comment('i')
onoremap <buffer> <silent> ic :call go#textobj#Comment('i')
xnoremap <buffer> <silent> if :call go#textobj#Function('i')
onoremap <buffer> <silent> if :call go#textobj#Function('i')
nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,0=},0=)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=make
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=go#complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 19 - ((18 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 020|
lcd ~/go/src/github.com/amissine/stellar_kelp_examples
tabnext
edit ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/fundaccount.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent>  :call go#def#StackPop(v:count1)
nnoremap <buffer> <silent> ] :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :GoDef
nnoremap <buffer> <silent> K :GoDoc
xnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('v', 'prev')
onoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('o', 'prev')
nnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('n', 'prev')
xnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('v', 'next')
onoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('o', 'next')
nnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('n', 'next')
xnoremap <buffer> <silent> ac :call go#textobj#Comment('a')
onoremap <buffer> <silent> ac :call go#textobj#Comment('a')
xnoremap <buffer> <silent> af :call go#textobj#Function('a')
onoremap <buffer> <silent> af :call go#textobj#Function('a')
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef
nnoremap <buffer> <silent> gd :GoDef
xnoremap <buffer> <silent> ic :call go#textobj#Comment('i')
onoremap <buffer> <silent> ic :call go#textobj#Comment('i')
xnoremap <buffer> <silent> if :call go#textobj#Function('i')
onoremap <buffer> <silent> if :call go#textobj#Function('i')
nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,0=},0=)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=make
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=go#complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 13 - ((2 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 066|
lcd ~/go/src/github.com/amissine/stellar_kelp_examples
tabnext
edit ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/getinfo.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent>  :call go#def#StackPop(v:count1)
nnoremap <buffer> <silent> ] :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :GoDef
nnoremap <buffer> <silent> K :GoDoc
xnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('v', 'prev')
onoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('o', 'prev')
nnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('n', 'prev')
xnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('v', 'next')
onoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('o', 'next')
nnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('n', 'next')
xnoremap <buffer> <silent> ac :call go#textobj#Comment('a')
onoremap <buffer> <silent> ac :call go#textobj#Comment('a')
xnoremap <buffer> <silent> af :call go#textobj#Function('a')
onoremap <buffer> <silent> af :call go#textobj#Function('a')
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef
nnoremap <buffer> <silent> gd :GoDef
xnoremap <buffer> <silent> ic :call go#textobj#Comment('i')
onoremap <buffer> <silent> ic :call go#textobj#Comment('i')
xnoremap <buffer> <silent> if :call go#textobj#Function('i')
onoremap <buffer> <silent> if :call go#textobj#Function('i')
nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,0=},0=)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=make
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=go#complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 28 - ((18 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 036|
tabnext
edit ~/go/src/github.com/amissine/stellar_kelp_examples/go/cfg_trader.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
nnoremap <buffer> <silent>  :call go#def#StackPop(v:count1)
nnoremap <buffer> <silent> ] :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :call go#def#Jump("split", 0)
nnoremap <buffer> <silent>  :GoDef
nnoremap <buffer> <silent> K :GoDoc
xnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('v', 'prev')
onoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('o', 'prev')
nnoremap <buffer> <silent> [[ :call go#textobj#FunctionJump('n', 'prev')
xnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('v', 'next')
onoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('o', 'next')
nnoremap <buffer> <silent> ]] :call go#textobj#FunctionJump('n', 'next')
xnoremap <buffer> <silent> ac :call go#textobj#Comment('a')
onoremap <buffer> <silent> ac :call go#textobj#Comment('a')
xnoremap <buffer> <silent> af :call go#textobj#Function('a')
onoremap <buffer> <silent> af :call go#textobj#Function('a')
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef
nnoremap <buffer> <silent> gd :GoDef
xnoremap <buffer> <silent> ic :call go#textobj#Comment('i')
onoremap <buffer> <silent> ic :call go#textobj#Comment('i')
xnoremap <buffer> <silent> if :call go#textobj#Function('i')
onoremap <buffer> <silent> if :call go#textobj#Function('i')
nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%-G#\ %.%#,%-G%.%#panic:\ %m,%Ecan't\ load\ package:\ %m,%A%f:%l:%c:\ %m,%A%f:%l:\ %m,%C%*\\s%m,%-G%.%#
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=cq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GoIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,<:>,0=},0=)
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=make
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=go#complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
13
normal! zo
22
normal! zo
31
normal! zo
35
normal! zo
42
normal! zo
let s:l = 76 - ((45 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
76
normal! 0
tabnext 2
set stal=1
badd +41 ~/go/src/github.com/amissine/stellar_kelp_examples/Makefile
badd +5 ~/go/src/github.com/amissine/stellar_kelp_examples/buysell.sh
badd +5 ~/go/src/github.com/amissine/stellar_kelp_examples/util/common.sh
badd +1 ~/go/src/github.com/amissine/stellar_kelp_examples/cfg/trader.cfg
badd +0 ~/go/src/github.com/amissine/stellar_kelp_examples/cfg/buysell.cfg
badd +19 ~/go/src/github.com/amissine/stellar_kelp_examples/.gitignore
badd +0 ~/go/src/github.com/amissine/stellar_kelp_examples/sh/cfg_buysell.sh
badd +6 ~/go/src/github.com/amissine/stellar_kelp_examples/sh/cfg_trader.sh
badd +1 ~/go/src/github.com/amissine/stellar_kelp_examples/go/cfg_trader.go
badd +21 ~/go/src/github.com/stellar/go/xdr/xdr_generated.go
badd +9 ~/go/src/github.com/stellar/go/keypair/from_address.go
badd +6 ~/go/src/github.com/sirupsen/logrus/terminal_check_bsd.go
badd +0 ~/go/src/github.com/amissine/stellar_kelp_examples/go/cfg.go
badd +13 ~/go/src/github.com/amissine/stellar_kelp_examples/main.go
badd +22 ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/root.go
badd +36 ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/getinfo.go
badd +5 ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/addaccount.go
badd +34 ~/go/src/github.com/amissine/stellar_kelp_examples/cmd/fundaccount.go
badd +1183 ~/go/src/github.com/amissine/stellar_kelp_examples/vendor/github.com/spf13/cobra/command.go
badd +131 ~/go/src/github.com/amissine/stellar_kelp_examples/vendor/github.com/spf13/pflag/flag.go
badd +65 ~/go/src/github.com/amissine/stellar_kelp_examples/vendor/github.com/spf13/pflag/string.go
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
