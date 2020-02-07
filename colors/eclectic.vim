set background=dark

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="eclectic"

let s:black = "#000000"
let s:gray = "#36393e"
let s:barely_lighter_gray = "#42464c"
let s:barely_darker_gray = "#34363b"
let s:darker_gray = "#2a2c30"
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
let s:red = "#d72862"

let s:cursor = s:super_cyan
let s:background = s:gray
let s:foreground = s:chalk
let s:foreground_alt = s:ice
let s:muted = s:soft_gray
let s:bg_light = s:barely_lighter_gray
let s:bg_plus_one_percent = s:barely_darker_gray
let s:bg_dark = s:darker_gray

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

let s:selected = s:nightshade
let s:invisibles = s:black
let s:alert = s:red

let s:git_renamed = "#0095aa"
let s:git_added = "#00aa7b"
let s:git_modified = "#f6b961"
let s:git_removed = "#d72862"

function! s:create_highlight(group, style)
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg") ? a:style.fg : "NONE")
    \ "guibg=" (has_key(a:style, "bg") ? a:style.bg : "NONE")
    \ "guisp=" (has_key(a:style, "sp") ? a:style.sp : "NONE")
    \ "gui=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
endfunction

" call s:create_highlight("Pmenu",       { "bg": s:faint })
" call s:create_highlight("PmenuThumb",  { "bg": s:norm })
" call s:create_highlight("PmenuSBar",   { "bg": s:subtle })
" call s:create_highlight("PmenuSel",    { "bg": s:faintBlue })
" call s:create_highlight("SpellBad",    { "sp": s:normRed, "gui": "undercurl" })
" call s:create_highlight("SpellCap",    { "sp": s:accent1, "gui": "undercurl" })
" call s:create_highlight("SpellRare",   { "sp": s:normGreen, "gui": "undercurl" })
" call s:create_highlight("SpellLocal",  { "sp": s:accent4, "gui": "undercurl" })
" call s:create_highlight("VertSplit",    { "fg": s:subtle, "bg": s:faint })
" call s:create_highlight("Folded",       { "fg": s:comment, "bg": s:faint })
set colorcolumn=80
call s:create_highlight("ColorColumn", { "bg": s:bg_plus_one_percent })
call s:create_highlight("MatchParen",  { "fg": s:background, "bg": s:muted })
call s:create_highlight("Normal", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("NonText", { "fg": s:invisibles })
call s:create_highlight("Cursor", { "fg": s:background, "bg": s:cursor })
call s:create_highlight("Visual", { "bg": s:selected })
call s:create_highlight("IncSearch", { "bg": s:muted })
call s:create_highlight("Search", { "bg": s:muted })
call s:create_highlight("StatusLine", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("StatusLineNC", { "fg": s:muted })
call s:create_highlight("SignColumn", { "fg": s:foreground })
call s:create_highlight("TabLine", { "fg": s:muted })
call s:create_highlight("TabLineSel", { "fg": s:foreground, "gui": "bold" })
call s:create_highlight("Directory", { "fg": s:accent_1 })
call s:create_highlight("Title", { "fg": s:accent_3, "gui": "bold" })
call s:create_highlight("ErrorMsg", { "fg": s:alert })
call s:create_highlight("DiffAdd", { "bg": s:git_added })
call s:create_highlight("DiffChange", { "bg": s:git_modified })
call s:create_highlight("DiffDelete", { "fg": s:git_removed })
call s:create_highlight("DiffText", { "bg": s:git_renamed })
call s:create_highlight("LineNr", { "fg": s:foreground_alt, "bg": s:bg_dark })
call s:create_highlight("SpecialKey", { "fg": s:invisibles })
call s:create_highlight("CursorLine", { "bg": s:background })
hi! link CursorLineNr CursorLine
hi! link WildMenu     IncSearch
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC

" Highlights - Generic Syntax ------------------------------{{{
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

" Highlights - Typescript
call s:create_highlight("TypescriptImport", { "fg": s:accent_2 })
hi! link TypescriptExport TypescriptImport

hi! link TypescriptTypeReference Type
hi! link TypescriptVariable Keyword
hi! link TypescriptTypeBrackets Exception
hi! link TypescriptGlobal Number
hi! link TypescriptBraces Normal
hi! link TypescriptAsyncFuncKeyword TypescriptImport
