highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
set colorcolumn=80

let g:colors_name="eclectic"

" colors {{{
let s:black = "#000000"
let s:gray = "#36393e"
let s:barely_darker_gray = "#34373c"
let s:darker_gray = "#2a2d30"
let s:lighter_gray = "#42464c"
let s:soft_gray = "#61666f"
let s:chalk = '#d9dec3'
let s:nightshade = "#4b4a53"
let s:cyan = "#81c7be"
let s:super_cyan = "49ffe8"
let s:teal = "#469c91"
let s:celery = "#a8b577"
let s:leaf = "#7ea158"
let s:gold = "#e6c37e"
let s:creamsicle = "#cea149"
let s:lavender = "#9c8db1"
let s:deep_purple = "#75628f"
let s:rose = "#c77fa4"
let s:fuscia = "#b75c8b"
let s:ice = "#b1d1b1"
" }}}

"variables {{{
" fg color variables {{{
let s:foreground = s:chalk
let s:foreground_alt = s:ice
let s:muted = s:soft_gray
" }}}

" bg color variables {{{
let s:background = s:gray
let s:bg_light = s:lighter_gray
let s:bg_barely_darker = s:barely_darker_gray
let s:bg_dark = s:darker_gray
let s:cursor = s:super_cyan
" }}}

" syntax color variables {{{
let s:keyword = s:rose
let s:keyword_alt = s:fuscia
let s:string = s:celery
let s:string_alt = s:leaf
let s:accent_1 = s:gold
let s:accent_1_alt = s:creamsicle
let s:accent_2 = s:lavender
let s:accent_2_alt = s:deep_purple
let s:accent_3 = s:cyan
let s:accent_3_alt = s:teal
" }}}

" misc color variables {{{
let s:selected = s:nightshade
let s:invisibles = s:black
let s:alert = "#d72862"
let s:warning = "#f6b961"
let s:success = "#00aa7b"
let s:info = "#0095aa"
" }}}
" }}}

function! s:create_highlight(group, style)
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg") ? a:style.fg : "NONE")
    \ "guibg=" (has_key(a:style, "bg") ? a:style.bg : "NONE")
    \ "guisp=" (has_key(a:style, "sp") ? a:style.sp : "NONE")
    \ "gui=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
endfunction

" popup menu {{{
call s:create_highlight("Pmenu", { "fg": s:foreground,"bg": s:bg_dark })
call s:create_highlight("PmenuThumb", { "bg": s:muted })
call s:create_highlight("PmenuSBar", { "bg": s:bg_light })
call s:create_highlight("PmenuSel", { "fg": s:keyword_alt, "bg": s:bg_dark,"gui": "bold" })
" }}}

" spelling {{{
call s:create_highlight("SpellBad", { "sp": s:warning, "gui": "undercurl" })
hi! link SpellCap Normal
hi! link SpellRare Normal
hi! link SpellLocal Normal
" }}}

" editor {{{
call s:create_highlight("ColorColumn", { "bg": s:bg_barely_darker })
call s:create_highlight("MatchParen",  { "fg": s:background, "bg": s:muted })
call s:create_highlight("Cursor", { "fg": s:background, "bg": s:cursor })
call s:create_highlight("Visual", { "bg": s:selected })

call s:create_highlight("IncSearch", { "gui": "reverse" })
call s:create_highlight("Search", { "gui": "bold,underline" })
hi! link WildMenu IncSearch

call s:create_highlight("StatusLine", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("StatusLineNC", { "fg": s:muted })
call s:create_highlight("TabLine", { "fg": s:muted })
call s:create_highlight("TabLineSel", { "fg": s:foreground, "gui": "bold" })

call s:create_highlight("LineNr", { "fg": s:foreground_alt, "bg": s:bg_dark })
call s:create_highlight("CursorLine", { "bg": s:background })
call s:create_highlight("CursorLineNr", { "fg": s:accent_1_alt, "bg": s:bg_dark, "gui": "bold" })
call s:create_highlight("VertSplit", { "fg": s:background, "bg": s:background })
call s:create_highlight("Folded", { "fg": s:accent_2, "bg": s:bg_barely_darker })
call s:create_highlight("FoldColumn", { "fg": s:accent_2,"bg": s:bg_dark })
" call s:create_highlight("SignColumn", { "fg": s:orange,"bg": s:red })
hi! link TabLineFill StatusLineNC

call s:create_highlight("Title", { "fg": s:accent_3, "gui": "bold" })
call s:create_highlight("ErrorMsg", { "fg": s:alert })
call s:create_highlight("WarningMsg", { "fg": s:warning })
call s:create_highlight("MoreMsg", { "fg": s:info })
hi! link Question MoreMsg
hi! link ModeMsg MoreMsg

call s:create_highlight("DiffAdd", { "bg": s:success })
call s:create_highlight("DiffChange", { "bg": s:warning })
call s:create_highlight("DiffDelete", { "fg": s:alert })
call s:create_highlight("DiffText", { "bg": s:info })
" }}}

" NERDTree {{{
call s:create_highlight("Directory", { "fg": s:accent_3_alt })

call s:create_highlight("NERDTreeDirSlash", { "fg": s:accent_3 })
hi! link NERDTreeOpenable NERDTreeDirSlash
hi! link NERDTreeClosable NERDTreeDirSlash
" }}}

" general highlighting rules {{{
call s:create_highlight("Normal", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("NonText", { "fg": s:invisibles })
hi! link SpecialKey NonText

call s:create_highlight("String", { "fg": s:string })
hi! link Character String

call s:create_highlight("Number", { "fg": s:accent_1 })
hi! link Float Number
hi! link Boolean Number
hi! link Constant Number

call s:create_highlight("Keyword", { "fg": s:keyword })
hi! link Statement Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Label Keyword

call s:create_highlight("Exception", { "fg": s:accent_3 })
hi! link PreProc Exception

call s:create_highlight("Comment", { "fg": s:muted, "gui": "italic" })
hi! link SpecialComment Comment
hi! link Delimeter Comment

call s:create_highlight("Operator", { "fg": s:ice })
hi! link Special Operator

call s:create_highlight("Type", { "fg": s:accent_3_alt })
hi! link Function Type

call s:create_highlight("Todo", { "gui": "reverse" })

hi! link Identifier Normal
hi! link Underlined Normal
" }}}

" typescript {{{
call s:create_highlight("TypescriptImport", { "fg": s:accent_2 })
hi! link TypescriptExport TypescriptImport

hi! link TypescriptTypeReference Type
hi! link TypescriptVariable Keyword
hi! link TypescriptTypeBrackets Exception
hi! link TypescriptGlobal Number
hi! link TypescriptBraces Normal
hi! link TypescriptAsyncFuncKeyword Number
hi! link TypescriptMember Normal
hi! link TypescriptObjectLabel Operator
hi! link TypescriptObjectLiteral Normal
hi! link TypescriptTry Number
hi! link TypescriptExceptions TypescriptTry
hi! link TypescriptParenExp ErrorMsg
" }}}

" ALE {{{
call s:create_highlight("ALEError", { "fg": s:alert, "bg": s:background, "gui": "bold" })
call s:create_highlight("ALEErrorSign", { "fg": s:alert, "bg": s:bg_dark, "gui": "bold" })
call s:create_highlight("ALEWarning", { "fg": s:warning, "gui": "bold" })
hi! link ALEWarningSign ALEWarning
" }}}

" git gutter {{{
call s:create_highlight("GitGutterAdd", { "fg": s:success, "bg": s:bg_dark })
call s:create_highlight("GitGutterDelete", { "fg": s:alert, "bg": s:bg_dark })
call s:create_highlight("GitGutterChange", { "fg": s:warning, "bg": s:bg_dark })
call s:create_highlight("GitGutterChangeDelete", { "fg": s:info, "bg": s:bg_dark })
" }}}

" airline {{{
"call s:create_highlight("", { "fg": s:, "bg": s:bg_dark })
" }}}
