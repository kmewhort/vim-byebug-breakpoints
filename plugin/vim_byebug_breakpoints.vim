au BufWrite,BufRead *.rb :call vim_byebug_breakpoints#LoadByebugBreakpoints()

command! ToggleByebugBreakpoint call vim_byebug_breakpoints#ToggleByebugBreakpoint()

if !exists('g:vim_byebug_breakpoints_map_keys') 
  let g:vim_byebug_breakpoints_map_keys = 1
endif
if g:vim_byebug_breakpoints_map_keys
  nnoremap <Leader>b :ToggleByebugBreakpoint<CR>
endif
