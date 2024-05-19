hi  LineNr                guibg=NONE
hi  CursorLineNr          guibg=NONE     gui=BOLD

augroup MyAutoCommands
  autocmd!
  " python
  au  Filetype  python  syn  keyword  pythonReplaceOperater  replace
  au  Filetype  python  hi   link     pythonBuiltinObj       pythonBuiltinAttr
  au  Filetype  python  hi   link     pythonDottedName       pythonDecorator
  au  Filetype  python  hi   link     pythonPrivateAttr      pythonNone
  au  Filetype  python  hi   link     pythonReplaceOperater  pythonStatement
  au  Filetype  python  hi   link     pythonSpaceError       Warning
  au  Filetype  python  syn  keyword  pythonStatement        class                       nextgroup=pythonClassName  skipwhite
  au  Filetype  python  syn  keyword  pythonBuiltinAttr      __abs__ __add__ __aenter__ __aexit__ __aiter__ __and__ __anext__ __annotations__ __await__ __bases__ __bool__ __bytes__ __call__ __ceil__ __class__ __class_getitem__ __classcell__ __closure__ __code__ __complex__ __contains__ __defaults__ __del__ __delattr__ __delete__ __delitem__ __dict__ __dir__ __divmod__ __doc__ __enter__ __eq__ __exit__ __file__ __float__ __floor__ __floordiv__ __format__ __func__ __future__ __ge__ __get__ __getattr__ __getattribute__ __getitem__ __globals__ __gt__ __hash__ __iadd__ __iand__ __ifloordiv__ __ilshift__ __imatmul__ __imod__ __import__ __imul__ __index__ __init__ __init_subclass__ __instancecheck__ __int__ __invert__ __ior__ __ipow__ __irshift__ __isub__ __iter__ __itruediv__ __ixor__ __kwdefaults__ __le__ __len__ __length_hint__ __lshift__ __lt__ __match_args__ __matmul__ __missing__ __mod__ __module__ __mro__ __mro_entries__ __mul__ __name__ __ne__ __neg__ __new__ __next__ __objclass__ __or__ __pos__ __pow__ __prepare__ __qualname__ __radd__ __rand__ __rdivmod__ __repr__ __reversed__ __rfloordiv__ __rlshift__ __rmatmul__ __rmod__ __rmul__ __ror__ __round__ __rpow__ __rrshift__ __rshift__ __rsub__ __rtruediv__ __rxor__ __self__ __set__ __set_name__ __setattr__ __setitem__ __slots__ __str__ __sub__ __subclasscheck__ __traceback__ __truediv__ __trunc__ __weakref__ __xor__
  au  Filetype  python  syn  match    pythonClassName        '[_a-zA-Z][_a-zA-Z0-9_]*'   display                    contained
  au  Filetype  python  syn  match    pythonPrivateAttr      "\<_[_a-zA-Z0-9]*"
augroup END

hi  CocErrorHighlight             guifg=#c6c8d1  guibg=#e27878
hi  CocErrorSign                  guifg=#e27878  guibg=NONE
hi  CocFadeOut                    gui=UNDERCURL  guifg=NONE     guibg=NONE      guisp=#e2c878
hi  CocHighlightText              term=REVERSE   ctermbg=235    guibg=#323753
hi  CocHintSign                   guifg=#e2c878  guibg=NONE
hi  CocInfoHighlight              gui=UNDERLINE  guifg=NONE     guibg=NONE      guisp=#e2c878
hi  CocInfoSign                   guifg=#e2c878  guibg=NONE
hi  CocInlayHint                  ctermfg=242    guifg=#6b7089
hi  CocSearch                     term=bold      ctermfg=110    guifg=#c6aa84   gui=BOLD
hi  CocWarningHighlight           guifg=#161821  guibg=#e2a478
hi  CocWarningSign                guifg=#e2a478  guibg=NONE
hi  CursorColumn                  term=REVERSE   ctermbg=235    guibg=#1e2132
hi  CursorLine                    term=REVERSE   ctermbg=235    guibg=#1e2132
hi  Error                         guifg=#c6c8d1  guibg=#e27878
hi  FgCocHintFloatBgCocFloating   ctermfg=242    guifg=#e2bf78
hi  FgCocInfoFloatBgCocFloating   ctermfg=242    guifg=#e2bf78
hi  VariableDefaultColor          guibg=NONE     guifg=#c6c8d1
hi  Warning                       guifg=#161821  guibg=#e2a478
hi  pythonBuiltinAttr             guibg=NONE     guifg=#e2bf78
hi  pythonClassName               guibg=NONE     guifg=#e2bf78
hi  pythonExClass                 guibg=NONE     guifg=#e27878
hi  pythonFunction                guibg=NONE     guifg=#e2a578
hi  pythonFunctionCall            guibg=NONE     guifg=#8490c6

" go
hi  goTypeName                    guibg=NONE     guifg=#e2bf78
hi  goFunction                    guibg=NONE     guifg=#e2a578

" yaml
au  BufEnter  yaml  hi   link     yamlConstant  Boolean
au  BufEnter  yaml  hi   link     yamlKey       Label
au  BufEnter  yaml  hi   link     yamlConstant  Boolean

" vim
au  Filetype  vim   syn  keyword  vimCommand    Plug

