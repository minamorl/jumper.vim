let s:save_cpo = &cpo
set cpo&vim

let s:prefix_test = "/tests/test_"

function! jumper#jumptotest()
  " To resolve relative path collectly, 'lcd' command must be called before jumping.
  let l:_ = getcwd()

  let l:current_folder = expand('%:h')
  execute "lcd" l:current_folder

  let l:dest = jumper#determine_dest()
  call jumper#jumpto(l:dest)

  execute "lcd" l:_
endfunction

function! jumper#determine_dest()
  let l:current_filename = expand('%:t')
  let l:filetype = &filetype

  if !exists('g:jumper_config.'.l:filetype)
    return l:current_filename
  endif
  
  let l:applied = g:jumper_config[l:filetype]
  return substitute(l:applied, "{}", l:current_filename, "")
endfunction

function! jumper#jumpto(dest)
  if !exists("g:jumper_popup_style")
    let g:jumper_popup_style = "vsplit"
  endif
  execute g:jumper_popup_style." ".fnamemodify(a:dest, ":p")
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
