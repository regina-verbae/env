"" Color -- Dark version -- Light version
"" Black    #313131  0      #656664
"" Red      #DD3A67  1      #F07294
"" Green    #4E9A06  2      #99BE75
"" Yellow   #D9B40F  3      #FCE94F
"" Blue     #407EC1  4      #93B0D0
"" Purple   #89688E  5      #C694C0
"" Cyan     #06989A  6      #34E2E2
"" White    #D3D7CF  7      #EEEEEC

hi clear
set background=light
if exists ("syntax_on")
    syntax reset
endif

let colors_name="mary"
hi clear Normal
hi Normal ctermfg=7 ctermbg=0 guifg=White guibg=#313131
hi SpecialKey term=bold ctermfg=4 guifg=#407EC1
hi NonText term=bold cterm=bold ctermfg=4 guifg=#407EC1
hi Directory term=bold ctermfg=4 guifg=#407EC1
hi ErrorMsg term=standout cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=#D3D7CF guibg=#DD3A67
hi IncSearch term=reverse cterm=reverse gui=reverse
hi Search term=reverse ctermfg=0 ctermbg=3 guifg=#313131 guibg=#D9B40F
hi MoreMsg term=bold ctermfg=2 guifg=#4E9A06
hi ModeMsg term=bold cterm=bold gui=bold
hi LineNr term=underline ctermfg=7 guifg=#D3D7CF
hi Question term=standout cterm=bold ctermfg=2 gui=bold guifg=#4E9A06
hi StatusLine term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Title term=bold cterm=bold ctermfg=5 gui=bold guifg=#89688E
hi Visual term=reverse cterm=reverse gui=reverse
hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg term=standout ctermfg=1 guifg=#DD3A67
hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=#313131 guibg=#D9B40F
hi Folded term=standout ctermfg=4 ctermbg=7 guifg=#407EC1 guibg=#D3D7CF
hi FoldColumn term=standout ctermfg=4 ctermbg=7 guifg=#407EC1 guibg=#D3D7CF
hi DiffAdd term=bold ctermbg=4 guibg=#407EC1
hi DiffChange term=bold ctermfg=5 guifg=#89688E
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=#407EC1 guibg=#06989A
hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=#DD3A67
hi SignColumn term=standout ctermfg=4 ctermbg=7 guifg=#407EC1 guibg=#D3D7CF
hi clear Conceal
hi SpellBad term=reverse ctermbg=1 gui=undercurl guisp=#DD3A67
hi SpellCap term=reverse ctermbg=4 gui=undercurl guisp=#407EC1
hi SpellRare term=reverse ctermbg=5 gui=undercurl guisp=#89688E
hi SpellLocal term=underline ctermbg=6 gui=undercurl guisp=#06989A
hi Pmenu ctermfg=5 guifg=#89688E
hi PmenuSel ctermbg=7 guibg=#D3D7CF
hi PmenuSbar ctermbg=7 guibg=#D3D7CF
hi PmenuThumb cterm=reverse gui=reverse
hi TabLine term=underline cterm=underline ctermfg=0 ctermbg=7 gui=underline guifg=#313131 guibg=#D3D7CF
hi TabLineSel term=bold cterm=bold gui=bold
hi TabLineFill term=reverse cterm=reverse gui=reverse
hi CursorColumn term=reverse ctermbg=7 guibg=#D3D7CF
hi CursorLine term=underline cterm=underline gui=underline
hi ColorColumn term=reverse ctermbg=1 guibg=#DD3A67
hi Cursor guifg=bg guibg=fg
hi lCursor guifg=bg guibg=fg
hi MatchParen term=reverse ctermbg=6 guibg=#06989A
hi Comment term=bold ctermfg=4 guifg=#407EC1
hi Constant term=underline ctermfg=1 guifg=#DD3A67
hi Special term=bold ctermfg=5 guifg=#89688E
hi Identifier term=underline ctermfg=6 guifg=#06989A
hi Statement term=bold cterm=bold ctermfg=3 gui=bold guifg=#D9B40F
hi PreProc term=underline ctermfg=5 guifg=#89688E
hi Type term=underline cterm=bold ctermfg=2 gui=bold guifg=#4E9A06
hi Underlined term=underline cterm=underline ctermfg=5 gui=underline guifg=#89688E
hi Ignore cterm=bold ctermfg=7 gui=bold guifg=#D3D7CF
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=#D3D7CF guibg=#DD3A67
hi Todo term=standout ctermfg=0 ctermbg=3 guifg=#313131 guibg=#D9B40F
hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float Number
hi link Function Identifier
hi link Conditional Statement
hi link Repeat Statement
hi link Label Statement
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
hi link perlTodo Todo
hi link perlPOD perlComment
hi clear perlGenericBlock
hi link perlConditional Conditional
hi link perlElseIfError Error
hi link perlRepeat Repeat
hi link perlOperator Operator
hi link perlControl PreProc
hi link perlStatementStorage perlStatement
hi link perlStatementControl perlStatement
hi link perlStatementScalar perlStatement
hi link perlStatementRegexp perlStatement
hi link perlStatementNumeric perlStatement
hi link perlStatementList perlStatement
hi link perlStatementHash perlStatement
hi link perlStatementIOfunc perlStatement
hi clear perlFiledescStatementNocomma
hi link perlStatementFiledesc perlStatement
hi clear perlFiledescStatementComma
hi link perlStatementVector perlStatement
hi link perlStatementFiles perlStatement
hi link perlStatementFlow perlStatement
hi link perlStatementInclude perlStatement
hi link perlStatementProc perlStatement
hi link perlStatementSocket perlStatement
hi link perlStatementIPC perlStatement
hi link perlStatementNetwork perlStatement
hi link perlStatementPword perlStatement
hi link perlStatementTime perlStatement
hi link perlStatementMisc perlStatement
hi link perlStatementIndirObj perlStatement
hi clear perlStatementInderObjWrap
hi link perlLabel Label
hi link perlVarPlain perlIdentifier
hi link perlVarNotInMatches perlIdentifier
hi link perlVarSlash perlIdentifier
hi link perlPackageRef perlType
hi clear perlVarMember
hi link perlVarSimpleMember perlIdentifier
hi link perlMethod perlIdentifier
hi link perlVarPlain2 perlIdentifier
hi link perlFunctionName perlIdentifier
hi clear perlVarBlock
hi clear perlVarBlock2
hi link perlShellCommand perlString
hi link perlFloat Float
hi link perlNumber Number
hi link perlStringUnexpanded perlString
hi link perlString String
hi link perlQQ perlString
hi link perlArrow perlIdentifier
hi link perlVarSimpleMemberName perlString
hi clear perlPackageConst
hi link perlFiledescRead perlIdentifier
hi link perlFiledescStatement perlIdentifier
hi link perlSpecialString perlSpecial
hi clear NONE
hi clear perlSpecialStringU2
hi link perlSpecialStringU perlSpecial
hi link perlSpecialMatch perlSpecial
hi link perlNotEmptyLine Error
hi link perlMatchStartEnd perlStatement
hi link perlVStringV perlStringStartEnd
hi clear perlParensSQ
hi clear perlBracketsSQ
hi clear perlBracesSQ
hi clear perlAnglesSQ
hi clear perlParensDQ
hi clear perlBracketsDQ
hi clear perlBracesDQ
hi clear perlAnglesDQ
hi link perlMatch perlString
hi link perlComment Comment
hi link perlSubstitutionGQQ perlString
hi link perlSubstitutionSQ perlString
hi link perlTranslationGQ perlString
hi link perlStringStartEnd perlString
hi link perlHereDoc perlString
hi clear perlAutoload
hi link perlStatementPackage perlStatement
hi link perlPackageDecl perlType
hi link perlSubError Error
hi link perlSubAttributesCont perlSubAttributes
hi link perlSubAttributes PreProc
hi link perlSubPrototypeError Error
hi link perlSubPrototype Type
hi link perlSubName Function
hi link perlFunction Keyword
hi link perlFunctionPRef perlType
hi link perlSharpBang PreProc
hi link perlFormatName perlIdentifier
hi link perlFormatField perlString
hi clear perlFormat
hi link perlDATA perlComment
hi link perlInclude Include
hi link perlSpecial Special
hi link perlCharacter Character
hi link perlType Type
hi link perlIdentifier Identifier
hi link perlStatement Statement
hi link perlList perlStatement
hi link perlMisc perlStatement
hi link perlStorageClass perlType
hi link perlSpecialAscii perlSpecial
hi link perlSpecialDollar perlSpecial
hi clear perlSync
hi clear perlSyncPOD
hi clear perlSubstitutionDQ
hi clear perlSubstitutionSlash
hi clear perlSubstitutionHash
hi clear perlSubstitutionBracket
hi clear perlSubstitutionCurly
hi clear perlSubstitutionPling
