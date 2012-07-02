autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

autocmd VimEnter * wincmd w

set nocompatible
"Syntax{{{
	syntax on
"}}}

"Line numbers {{{
	set number
"}}}


" Colour schemes {{{
        set background=dark
        colorscheme solarized
" }}}

    let g:solarized_termcolors=256

    " Setup Bundle Support {{{
    " The next two lines ensure that the ~/.vim/bundle/ system works
"        filetype off
        runtime! autoload/pathogen.vim
        silent! call pathogen#helptags()
        silent! call pathogen#runtime_append_all_bundles()
    " }}}


    if has('statusline') " {{{
        set laststatus=2

        " Broken down into easily includeable segments
        "set statusline=\ [%{getcwd()}]          " current dir
        set statusline=%<%f\    " Filename
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ %w%h%m%r\ " Options
        "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        "set statusline+=%=%-14.(%{WordCount()}\ %l,%c%V%)\ %p%%  " Right aligned file nav info
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif " }}}

    au BufNewFile,BufRead *.less set filetype=less              " less syntax
    au BufNewFile,BufRead *.tpl set filetype=smarty.html        " smarty syntax
    au BufNewFile,BufRead *.coffee set filetype=coffee          " coffee syntax
    au BufNewFile,BufRead *.styl set filetype=stylus            " stylus syntax
    au BufNewFile,BufRead gitconfig set filetype=gitconfig      " gitconfig syntax

    let g:tex_flavor='latex'                                    " use latex styles


" VIM UI {{{

    set ruler                                                   " always display cursor position
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set backspace=indent,eol,start                              " backspace for dummys

    set incsearch                                               " search as type
    set hlsearch                                                " highlight search terms
    set ignorecase smartcase                                    " ignore case except explicit UC
"}}}

" Spelling {{{

    set spell                     " enable spell check
    " au BufRead *.use,*.conf,*.cfg,*/conf.d/*,*.log,.vimrc set nospell

    au Filetype c,css,html,javascript,php,tex,text,mkd,wiki,vimwiki setlocal spell
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell " git commit messages
    au Filetype help setlocal nospell
    au StdinReadPost * setlocal nospell         " but not in man

    set spelllang=en_gb                         " spell check language to GB

    set dictionary+=/usr/share/dict/words       " add standard words

" }}}


 "Plugin configuration {{{

    " Maps auto-completion to <Tab>, else inputs Tab. {{{
        function! SuperCleverTab()
            if strpart(getline("."), 0, col(".")-1) =~ '^\s*$\|^.*\s$\|^.*[,;)}\]]$'
                return "\<Tab>"
            else
                if &omnifunc != ''
                    return "\<C-X>\<C-O>"
                else
                    return "\<C-N>"
                endir
            endif
        endfunction

        " inoremap <Tab> <C-R>=SuperCleverTab()<cr>
    " }}}


    " NerdTree {{{
        "map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        "map <leader>e :NERDTreeFind<CR>
        "nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        "let NERDTreeChDirMode=0
        "let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let NERDTreeWinSize=20
        " autocmd VimEnter * NERDTree
        " autocmd BufEnter * NERDTreeMirror
    " }}}

    " Gundo {{{
        nnoremap <F5> :GundoToggle<CR>
        let g:gundo_right = 1
    " }}}


    " MiniBufExplorer {{{
        let g:miniBufExplMapCTabSwitchBufs = 1
        let g:miniBufExplUseSingleClick = 1
    " }}}


    " Fugitive {{{
        nnoremap <leader>gs :Gstatus<CR>
        nnoremap <leader>gc :Gcommit<CR>
    " }}}
" }}}

