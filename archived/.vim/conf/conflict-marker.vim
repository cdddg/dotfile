let g:conflict_marker_enable_highlight = 1

let g:conflict_marker_begin = '^<<<<<<< \@='
let g:conflict_marker_common_ancestors = '^||||||| .*$'
let g:conflict_marker_separator = '^=======$'
let g:conflict_marker_end   = '^>>>>>>> \@='
let g:conflict_marker_enable_highlight = 1

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

hi! ConflictMarkerBegin                guibg=#45493e
hi! ConflictMarkerOurs                 guibg=#45493e
hi! ConflictMarkerTheirs               guibg=#384851
hi! ConflictMarkerEnd                  guibg=#384851
hi! ConflictMarkerCommonAncestorsHunk  guibg=#754a81
