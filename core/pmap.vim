
nmap <leader>e :CocCommand explorer<CR>
noremap <silent> <Leader>j :execute 'CocCommand explorer' .
		\ ' --toggle' .
		\ ' --position=floating' .
		\ ' --sources=file+'<CR>
nnoremap <silent> <Leader>od :DBUIToggle<CR>

"--------------------------"
"     vim-clap Keymap      "
"--------------------------"
nnoremap <silent> <Leader>scc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>bl :<C-u>Clap buffers<CR>
nnoremap <silent> <Leader>fg :<C-u>Clap grep2<CR>
nnoremap <silent> <Leader>ml :<C-u>Clap marks<CR>
"like emacs counsel-find-file
nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
nnoremap <silent> <Leader>fF :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
nnoremap <silent> <Leader>ff :<C-u>Clap gfiles<CR>
nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><cr>
nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
nnoremap <silent> <Leader>go :<C-u>Clap git_diff_files<CR>
nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
nnoremap <silent> <Leader>oc :<C-u>Clap personalconf<CR>

"--------------------------"
"     coc-clap Keymap      "
"--------------------------"
" Show all diagnostics
" Lint diagnostics
nnoremap <silent> <Leader>ld  :Clap coc_diagnostics<CR>
" Manage extensions
nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
" Show commands
nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
" Search workspace symbols
nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
nnoremap <silent> <leader>ct  :Clap coc_outline<CR>

function! InitCaw() abort
	if ! (&l:modifiable && &buftype ==# '')
		silent! nunmap <buffer> gc
		silent! xunmap <buffer> gc
		silent! nunmap <buffer> gcc
		silent! xunmap <buffer> gcc
	else
		nmap <buffer> gc <Plug>(caw:prefix)
		xmap <buffer> gc <Plug>(caw:prefix)
		nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
	endif
endfunction
autocmd FileType * call InitCaw()
call InitCaw()

nnoremap <silent> <Leader>i :<C-u>Vista!!<CR>

nnoremap <silent> <Leader>cr :QuickRun<CR>

nmap gsj <Plug>(easymotion-w)
nmap gsk <Plug>(easymotion-b)
nmap gsf <Plug>(easymotion-overwin-f)
nmap gss <Plug>(easymotion-overwin-f2)

nmap <silent> sa <Plug>(operator-sandwich-add)
xmap <silent> sa <Plug>(operator-sandwich-add)
omap <silent> sa <Plug>(operator-sandwich-g@)
nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> sd <Plug>(operator-sandwich-delete)
nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)  xmap <silent> sr <Plug>(operator-sandwich-replace)
nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap is <Plug>(textobj-sandwich-query-i)
xmap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
xmap as <Plug>(textobj-sandwich-query-a)

silent! xmap I  <Plug>(niceblock-I)
silent! xmap gI <Plug>(niceblock-gI)
silent! xmap A  <Plug>(niceblock-A)

xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)

nmap dsf <Plug>DsfDelete
nmap csf <Plug>DsfChange

let g:splitjoin_join_mapping = ''
let g:splitjoin_split_mapping = ''
nmap sj :SplitjoinJoin<CR>
nmap ss :SplitjoinSplit<CR>

xmap p <Plug>(operator-replace)

omap <silent> ab <Plug>(textobj-multiblock-a)
omap <silent> ib <Plug>(textobj-multiblock-i)
xmap <silent> ab <Plug>(textobj-multiblock-a)
xmap <silent> ib <Plug>(textobj-multiblock-i)

omap <silent> af <Plug>(textobj-function-a)
omap <silent> if <Plug>(textobj-function-i)
xmap <silent> af <Plug>(textobj-function-a)
xmap <silent> if <Plug>(textobj-function-i)

nnoremap <silent> <Leader>ga :Git add %:p<CR>
nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
nnoremap <silent> <Leader>gc :Git commit<CR>
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gf :Gfetch<CR>
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>

"--------------------------"
"     Coc Keymap           "
"--------------------------"
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <Leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <Leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" Do default action for next item.
nmap <silent> [a  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent> ]a  :<C-u>CocPrev<CR>
" Use [e and ]e for navigate diagnostics
nmap <silent> ]e <Plug>(coc-diagnostic-prev)
nmap <silent> [e <Plug>(coc-diagnostic-next)
" Remap for rename current word
nmap <Leader>cn <Plug>(coc-rename)
" Remap for format selected region
vmap <Leader>cf  <Plug>(coc-format-selected)
nmap <Leader>cf  <Plug>(coc-format-selected)
" Fix autofix problem of current line
nmap <Leader>cF  <Plug>(coc-fix-current)
" Remap keys for gotos
" nmap <silent> gd :<C-u>call initself#definition_other_window()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gD <Plug>(coc-declaration)
" Use K for show documentation in float window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" nmap ]g <Plug>(coc-git-prevchunk)
" nmap [g <Plug>(coc-git-nextchunk)

nmap <leader>gk <Plug>(coc-git-prevchunk)
nmap <leader>gj <Plug>(coc-git-nextchunk)
"show chunk diff at current position
nmap <Leader>gp <Plug>(coc-git-chunkinfo)
"show commit contains current position
nmap <Leader>gC <Plug>(coc-git-commit)
" float window scroll
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Add :OR command for organize imports of the current buffer.
command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <Leader>co :<C-u>OR<CR>
" multiple cursors
nmap <silent><M-s> <Plug>(coc-cursors-position)
nmap <expr> <silent><M-d> initself#select_current_word()
xmap <silent><M-d> <Plug>(coc-cursors-range)
nmap <silent><M-c>  <Plug>(coc-cursors-operator)

" Use :Format for format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <leader>lf :call CocAction('format')<CR>

nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap gcj :execute 'CocCommand docthis.documentThis'<CR>


" barbar "
nnoremap <silent>    <S-h> :BufferPrevious<CR>
nnoremap <silent>    <S-l> :BufferNext<CR>
nnoremap <silent>    <leader>< :BufferMovePrevious<CR>
nnoremap <silent>    <leader>> :BufferMoveNext<CR>
nnoremap <silent>    <leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <leader>9 :BufferLast<CR>
nnoremap <silent>    <leader>p :BufferPin<CR>
nnoremap <silent>    <leader>bcc :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
nnoremap <silent>    <leader>bec :BufferCloseAllButCurrent<CR>
nnoremap <silent>    <leader>bep :BufferCloseAllButPinned<CR>
nnoremap <silent>    <leader>bej :BufferCloseBuffersLeft<CR>
nnoremap <silent>    <leader>bek :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <leader>bp    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bon :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bod :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bol :BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

"--------------------------"
"     vim-floaterm Keymap  "
"--------------------------"

nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <C-_>  :FloatermNew --height=0.5 --width=0.5 --wintype=floating --position=bottomright<CR>
tnoremap <localleader>b <C-\><C-n><C-w>h
" nnoremap <localleader>b :FloatermToggle<CR>
nmap <localleader>cp :call coc#float#close_all() <CR>
nnoremap <silent> <Leader>ot :<C-u>FloatermToggle<CR>
tnoremap <silent> <Leader>ot <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <Leader>gg :<C-u>FloatermNew height=0.7 width=0.8 lazygit<CR>

autocmd filetype cpp nnoremap <F2> :w <bar> FloatermSend g++ -std=c++14 % -o %:r <CR>
autocmd filetype cpp nnoremap <F3> :exec 'FloatermSend ./%:r' <bar> FloatermToggle<CR>
autocmd filetype cpp nnoremap <F4> :exec 'FloatermSend ./%:r < %:r.inp' <bar> FloatermToggle<CR>

" function! StartFloatermSilently() abort
"   FloatermNew
"   call timer_start(1, {-> execute('FloatermHide!')})
" endfunction
" autocmd VimEnter * call StartFloatermSilently()

nnoremap <silent> <C-i> <C-i>


"--------------------------"
"     Ipython-cell Keymap  "
"--------------------------"
"
nnoremap <leader>as :SlimeSend1 ipython --matplotlib<CR>
nnoremap <leader>ar :IPythonCellRun<CR>
nnoremap <leader>aR :IPythonCellRunTime<CR>
nnoremap <leader>ac :IPythonCellExecuteCell<CR>
nnoremap <leader>aC :IPythonCellExecuteCellJump<CR>
nnoremap <leader>al :IPythonCellClear<CR>
nnoremap <leader>ax :IPythonCellClose<CR>
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>
nmap <leader>ah <Plug>SlimeLineSend
xmap <leader>ah <Plug>SlimeRegionSend
nnoremap <leader>ap :IPythonCellPrevCommand<CR>
nnoremap <leader>aQ :IPythonCellRestart<CR>
nnoremap <leader>ad :SlimeSend1 %debug<CR>
nnoremap <leader>aq :SlimeSend1 exit<CR>
autocmd filetype python nnoremap <F2> :SlimeSend1 python % <CR>
"let g:ipython_cell_tag = ['# %%', '#%%', '# <codecell>', '##']

" Goyo
nnoremap <Leader>G :Goyo<CR>

" Markdown preview
nnoremap <silent> <Leader>om  :<C-u>MarkdownPreview<CR>

" Open dashboard
" nnoremap <silent> <Leader>os  :<C-u>Dashboard<CR>

"-------"
"Far.vim"
"-------"
"shortcut for far.vim find
nnoremap <silent> <localleader>f  :Farf<cr>
vnoremap <silent> <localleader>f  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <localleader>r  :Farr<cr>
vnoremap <silent> <localleader>r  :Farr<cr>
