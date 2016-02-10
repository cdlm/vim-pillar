" Vim syntax file
" Language: Pillar
" URL: https://github.com/pillar-markup/pillar-documentation

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn sync linebreaks=1


""" Block level markup

syn match pillarHeader /^!\+.\+$/ contains=@Spell

syn match pillarPreBlock /= .*\n/ contained nextgroup=pillarCodeBlock
syn region pillarCodeBlock start=/^\[\[\[\([^=]\+=[^|]\+\(|[^=]\+=[^|]\+\)*\)\?\n/ end=/^]]]/

syn match pillarTable /^|.*$/ contained nextgroup=pillarTable

syn match pillarListItem /^[-#]+/ contained nextgroup=pillarListItem
syn match pillarDefnItem /^;.*$/ contained nextgroup=pillarDataItem
syn match pillarDataItem /^:/ contained nextgroup=pillarDefnItem

syn match pillarAnnotation /^@@\(note\|todo\)\s+.*$/ contained
syn match pillarComment /^%.*$/ contained nextgroup=pillarComment
syn region pillarRaw start=/^{{{\(latex\|html\|markdown\):\n/ end=/^}}}/


""" Inline markup

syn match pillarLink /\([+*]\)\([^>]+>\)\?[^|+*]+\(|[^=]+=[^|+*]+\)*\1/

syn match pillarStrong        /\s""\([^" ]\|[^"]\( [^"]\)\+\)\+""/ contains=@Spell
syn match pillarEmphasis      /\s''\([^' ]\|[^']\( [^']\)\+\)\+''/ contains=@Spell
syn match pillarMonospace     /\s==\([^= ]\|[^=]\( [^=]\)\+\)\+==/ contains=@Spell
syn match pillarStrikethrough /\s--\([^- ]\|[^-]\( [^-]\)\+\)\+--/ contains=@Spell
syn match pillarUnderlined    /\s__\([^_ ]\|[^_]\( [^_]\)\+\)\+__/ contains=@Spell
syn match pillarSubscript     /\s@@\([^@ ]\|[^@]\( [^@]\)\+\)\+@@/ contains=@Spell
syn match pillarSuperscript   /\s\^\^\([^^ ]\|[^^]\( [^^]\)\+\)\+\^\^/ contains=@Spell


""" highlight groups

hi link pillarHeader Title

hi link pillarPreBlock String
hi link pillarCodeBlock String

hi link pillarTable Operator

hi link pillarListItem Operator
hi link pillarDefnItem Define
hi link pillarDataItem Operator

hi link pillarAnnotation Keyword
hi link pillarComment Comment
hi link pillarRaw Comment

hi link pillarLink Identifier

hi link pillarStrong        Special
hi link pillarEmphasis      Special
hi link pillarMonospace     String
hi link pillarStrikethrough Special
hi link pillarUnderlined    Special
hi link pillarSubscript     Special
hi link pillarSuperscript   Special
