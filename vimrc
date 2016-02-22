

" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor 
set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
set helpfile=$VIMRUNTIME/doc/help.txt

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*		set ft=mail
  au BufRead reportbug-*		set ft=mail
augroup END

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make

" The following are personal customs
" set number
set hlsearch
set cino:=0		" When using '=' in viual mode to format the code,
			" switch case code will be formated unformly.
set iskeyword+=-	" set '-' is the keyword
set lbr			" set linebreak

set shiftwidth=8
set clipboard+=unname
setlocal noswapfile
set bufhidden=hide
set noerrorbells

" help new-omni-completion
filetype plugin indent on
set completeopt=longest,menu
let tags=getcwd()."/tags"

" cscope key map
nmap <C-l>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-l>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-l>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-l>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-l>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-l>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-l>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-l>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

" NERD_commenter
let NERDSpaceDelims = 1
let NERDShutUp = 1

" lookup plugin, need to run cscope_lu.sh file to create
" file tags to file filenametags
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
  let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lf :LUTags<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>
set nu
" color evening
set tabstop=8
set smartindent
set ai!
set matchtime=2
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
set vb t_vb=
set tags=tags

"cscope add mmmmmm
"echo strpart(directory,3)            

"echo  system("cscope_tmp=${directory//\//#} &&  cscope=${cscope_tmp/#*#/~/cscope/} && echo $cscope")
" echo pat
let directory = getcwd()
"let ll = strridx(directory, "/")  
"let nnnnn = strpart(directory,ll)
let mmmmm = printf("%s%s%s%s",$HOME,"/cscope",directory,"/cscope.out")
let csstr = printf("cscope add %s",mmmmm)
if filereadable(mmmmm)
execute csstr
endif			

