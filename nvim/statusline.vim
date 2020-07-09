function! ModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi fgc guifg=#3B4151 guibg=#87C0D0
    hi powerline guifg=#87C0D0
    hi fgc_b guifg=#e1acff guibg=#A7C080
  " Insert mode
  elseif a:mode == 'i'
    hi fgc guifg=#3B4151 guibg=#EBEFF3
    hi powerline guifg=#EBEFF3
    hi fgc_b guifg=#ffe585 guibg=#d8caac
  " Replace mode
  elseif a:mode == 'R'
    hi fgc guifg=#3B4151 guibg=#B48EAB
    hi powerline guifg=#B48EAB
    hi fgc_b guifg=#f0b295 guibg=#e39b7b
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == ""
    hi fgc guifg=#3B4151 guibg=#8ABCBB
    hi powerline guifg=#8ABCBB
    hi fgc_b guifg=#f07178 guibg=#e68183
  " Command mode
  elseif a:mode == 'c'
    hi fgc guifg=#32343e guibg=#bdd0e5 
    hi powerline guifg=#bdd0e5 
    hi fgc_b guifg=#bdd0e5 guibg=#434758
  " Terminal mode
  elseif a:mode == 't'
    hi fgc guifg=#32343e guibg=#a3f7ff
    hi powerline guifg=#a3f7ff 
    hi fgc_b guifg=#a3f7ff guibg=#434758
  endif

  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" Return a nice mode name
function! ModeName(mode)
  if a:mode == 'n'
    return 'NORMAL'
  " Insert mode
  elseif a:mode == 'i'
    return 'INSERT'
  " Replace mode
  elseif a:mode == 'R'
    return 'REPLACE'
  " Visual mode
  elseif a:mode == 'v'
    return 'VISUAL'
  elseif a:mode == 'V'
    return "V-LINE"
  elseif a:mode == ""
    return "V-BLOCK"
  " Command mode
  elseif a:mode == 'c'
    return 'COMMAND'
  " Terminal mode
  elseif a:mode == 't'
    return 'TERMINAL'
  endif
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
 let l:branchname = GitBranch()
 return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{ModeColors(mode())}
set statusline+=%#powerline#%#fgc#%{ModeName(mode())}%#powerline#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ 

" set statusline+=%{StatuslineGit()}

