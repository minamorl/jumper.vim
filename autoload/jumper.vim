let s:save_cpo = &cpo
set cpo&vim

let s:prefix_test = "/tests/test_"

function! jumper#jumptotest()
  let l:current = expand('%:p:h')
  let l:parent = fnamemodify(l:current, ':h') 
  let l:filename = expand('%:t') 
  call jumper#jumpto(l:parent.s:prefix_test.l:filename)
endfunction

function! jumper#jumpto(dest)
  if !exists("g:jumper_popup_style")
    let g:jumper_popup_style = "vsplit"
  endif
  execute g:jumper_popup_style a:dest
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
