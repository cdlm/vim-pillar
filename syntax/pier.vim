" Vim syntax file
" Language: Pier
" URL: https://github.com/DamienCassou/pillar-documentation

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn sync linebreaks=1


""" Block level markup

syn match pierHeader /^!\+.\+$/ contains=@Spell

syn match pierPreBlock /= .*\n/ contained nextgroup=pierCodeBlock
syn region pierCodeBlock start=/^\[\[\[\([^=]\+=[^|]\+\(|[^=]\+=[^|]\+\)*\)\?\n/ end=/^]]]/

syn match pierTable /^|.*$/ contained nextgroup=pierTable

syn match pierListItem /^[-#]+/ contained nextgroup=pierListItem
syn match pierDefnItem /^;.*$/ contained nextgroup=pierDataItem
syn match piedDataItem /^:/ contained nextgroup=pierDefnItem

syn match pierAnnotation /^@@\(note\|todo\)\s+.*$/ contained
syn match pierComment /^%.*$/ contained nextgroup=pierComment
syn region pierRaw start=/^{{{\(latex\|html\|markdown\):\n/ end=/^}}}/


""" Inline markup

syn match pierLink /\([+*]\)\([^>]+>\)\?[^|+*]+\(|[^=]+=[^|+*]+\)*\1/

syn match pierStrong        /\s""\([^" ]\|[^"]\( [^"]\)\+\)\+""/ contains=@Spell
syn match pierEmphasis      /\s''\([^' ]\|[^']\( [^']\)\+\)\+''/ contains=@Spell
syn match pierMonospace     /\s==\([^= ]\|[^=]\( [^=]\)\+\)\+==/ contains=@Spell
syn match pierStrikethrough /\s--\([^- ]\|[^-]\( [^-]\)\+\)\+--/ contains=@Spell
syn match pierUnderlined    /\s__\([^_ ]\|[^_]\( [^_]\)\+\)\+__/ contains=@Spell
syn match pierSubscript     /\s@@\([^@ ]\|[^@]\( [^@]\)\+\)\+@@/ contains=@Spell
syn match pierSuperscript   /\s\^\^\([^^ ]\|[^^]\( [^^]\)\+\)\+\^\^/ contains=@Spell


""" highlight groups

hi link pierHeader Title

hi link pierPreBlock String
hi link pierCodeBlock String

hi link pierTable Operator

hi link pierListItem Operator
hi link pierDefnItem Define
hi link pierDataItem Operator

hi link pierAnnotation Keyword
hi link pierComment Comment
hi link pierRaw Comment

hi link pierLink Identifier

hi link pierStrong        Special
hi link pierEmphasis      Special
hi link pierMonospace     String
hi link pierStrikethrough Special
hi link pierUnderlined    Special
hi link pierSubscript     Special
hi link pierSuperscript   Special
