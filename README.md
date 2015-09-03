# jumper.vim

**jumper.vim** - Easiest way to toggle files.

## Installation

Add to your .vimrc:

    NeoBundle 'minamorl/jumper.vim'

## Example


    let g:jumper_popup_style = "vsplit"
    let g:jumper_config = {}
    let g:jumper_config.python = "../tests/test_{}"
    nnoremap <silent> <leader>t :call jumper#jump()<cr>

`'{}'` is a holderplace that replesents current filename. 

For example, if you are in 'example/example.py', press "\<leader\>t", then jumper.vim looks up filetype and opens `"test/test_example.py"` by defined rules.
