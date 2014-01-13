let s:opts = {}

function! s:opts.global_replace(options) "{{{1
  return self.buffer_replace(bufnr(''), a:options)
endfunction

function! s:opts.global_get(vars) "{{{1
  return self.buffer_get(bufnr(''), a:vars)
endfunction

function! s:opts.global_set(options) "{{{1
  call self.buffer_set(bufnr(''), a:options)
endfunction

function! s:opts.buffer_replace(bufnr, options) "{{{1
  let R = self.buffer_get(a:bufnr, keys(a:options))
  call self.buffer_set(a:bufnr, a:options)
  return R
endfunction

function! s:opts.buffer_get(bufnr, vars) "{{{1
  let R = {}
  for var in a:vars
    let R[var] = getbufvar(a:bufnr, var)
  endfor
  return R
endfunction

function! s:opts.buffer_set(bufnr, options) "{{{1
  for [var, val] in items(a:options)
    call setbufvar(a:bufnr, var, val)
    unlet var val
  endfor
endfunction

function! s:opts.window_replace(winnr, options) "{{{1
  let R = self.window_get(a:winnr, keys(a:options))
  call self.window_set(a:winnr, a:options)
  return R
endfunction

function! s:opts.window_get(winnr, vars) "{{{1
  let R = {}
  for var in a:vars
    let R[var] = getwinvar(a:winnr, var)
  endfor
  return R
endfunction

function! s:opts.window_set(winnr, options) "{{{1
  for [var, val] in items(a:options)
    call setwinvar(a:winnr, var, val)
    unlet var val
  endfor
endfunction
"}}}

function! t9mdlib#opts#new()
  return s:opts
endfunction

if expand("%:p") !=# expand("<sfile>:p")
  finish
endif

function! s:uniq(list) "{{{1
  let R = []
  for e in a:list
    if index(R, e) !=# -1
      continue
    endif
    call add(R, e)
  endfor
  return R
endfunction

function! s:visible_buffer() "{{{1
  return s:uniq(tabpagebuflist(tabpagenr()))
endfunction
"}}}

finish

" vim: foldmethod=marker
