let s:opts = t9mdlib#opts#new()

let s:test = {}
function! s:test.opts_global() "{{{1
  let opts = {
        \ '&cursorline': 0,
        \ '&scrolloff':  0,
        \ '&lazyredraw': 1,
        \ }

  echo '=initial'
  let saved = s:opts.global_get(keys(opts))
  echo saved

  echo '=set'
  call s:opts.global_set(opts)
  echo s:opts.global_get(keys(opts))

  echo '=restore'
  call s:opts.global_set(saved)
  echo s:opts.global_get(keys(opts))
endfunction


function! s:test.opts_buffer() "{{{1
  let opts = {
        \ '&modified':   1,
        \ '&modifiable': 1,
        \ '&readonly':   1,
        \ '&buftype':    '',
        \ }
  echo '=initial'
  let saved = s:opts.buffer_get(bufnr(''), keys(opts))
  echo saved

  echo '=set'
  call s:opts.buffer_set(bufnr(''), opts)
  echo s:opts.buffer_get(bufnr(''), keys(opts))

  echo '=restore'
  call s:opts.buffer_set(bufnr(''), saved)
  echo s:opts.buffer_get(bufnr(''), keys(opts))
endfunction

function! s:test.opts_window() "{{{1
  let opts = {
        \ '&wrap':         0,
        \ '&list':         0,
        \ '&foldenable':   0,
        \ '&conceallevel': 0,
        \ }
  echo '=initial'
  let saved = s:opts.window_get(winnr(), keys(opts))
  echo saved

  echo '=set'
  call s:opts.window_set(winnr(), opts)
  echo s:opts.window_get(winnr(), keys(opts))

  echo '=restore'
  call s:opts.window_set(winnr(), saved)
  echo s:opts.window_get(winnr(), keys(opts))

  echo '=replace'
  let saved = s:opts.window_replace(winnr(), opts)
  echo s:opts.window_get(winnr(), keys(opts))

  echo '=restore'
  call s:opts.window_set(winnr(), saved)
  echo s:opts.window_get(winnr(), keys(opts))
endfunction
"}}}
call s:test.opts_global()
call s:test.opts_buffer()
call s:test.opts_window()
" vim: foldmethod=marker
