hi  LineNr                guibg=NONE
hi  CursorLineNr          guibg=NONE     gui=BOLD

" python
au  Filetype  python  syn  keyword  pythonReplaceOperater  replace
au  Filetype  python  hi   link     pythonBuiltinObj       pythonBuiltinAttr
au  Filetype  python  hi   link     pythonDottedName       pythonDecorator
au  Filetype  python  hi   link     pythonPrivateAttr      pythonNone
au  Filetype  python  hi   link     pythonReplaceOperater  pythonStatement
au  Filetype  python  hi   link     pythonSpaceError       Warning
au  Filetype  python  syn  keyword  pythonStatement        class                       nextgroup=pythonClassName  skipwhite
au  Filetype  python  syn  match    pythonBuiltinAttr      "__[a-zA-Z][a-zA-Z0-9]*__"
au  Filetype  python  syn  match    pythonClassName        '[_a-zA-Z][_a-zA-Z0-9_]*'   display                    contained
au  Filetype  python  syn  match    pythonPrivateAttr      "\<_[_a-zA-Z0-9]*"
hi  CocErrorHighlight     guifg=#c6c8d1  guibg=#e27878
hi  CocErrorSign          guifg=#e27878  guibg=NONE
hi  CocWarningHighlight   guifg=#161821  guibg=#e2a478
hi  CocWarningSign        guifg=#e2a478  guibg=NONE
hi  CocFadeOut            gui=UNDERCURL  guifg=NONE     guibg=NONE      guisp=#e2c878
hi  CocHintSign           guifg=#e2c878  guibg=NONE
hi  CocInfoHighlight      gui=UNDERLINE  guifg=NONE     guibg=NONE      guisp=#e2c878
hi  CocInfoSign           guifg=#e2c878  guibg=NONE
hi  CocHighlightText      term=REVERSE   ctermbg=235    guibg=#323753
hi  Error                 guifg=#c6c8d1  guibg=#e27878
hi  VariableDefaultColor  guibg=NONE     guifg=#c6c8d1
hi  Warning               guifg=#161821  guibg=#e2a478
hi  pythonBuiltinAttr     guibg=NONE     guifg=#e2bf78
hi  pythonClassName       guibg=NONE     guifg=#e2bf78
hi  pythonExClass         guibg=NONE     guifg=#e27878
hi  pythonFunction        guibg=NONE     guifg=#e2a578
hi  pythonFunctionCall    guibg=NONE     guifg=#8490c6
hi  CursorColumn          term=REVERSE   ctermbg=235    guibg=#1e2132
hi  CursorLine            term=REVERSE   ctermbg=235    guibg=#1e2132


" yaml
au  BufEnter  yaml  hi   link     yamlKey       Label
au  BufEnter  yaml  hi   link     yamlConstant  Boolean

" vim
au  Filetype  vim   syn  keyword  vimCommand    Plug
