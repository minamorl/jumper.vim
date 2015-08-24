let s:save_cpo = &cpo
set cpo&vim

function! jumper#jumptotest()
  let l:current = expand('<sfile>:p:h')
  let l:parent = fnamemodify(l:current, ':h') 
  let l:filename = expand('%:t') 
  execute "tabnew" l:parent."/tests/test_".l:filename
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
