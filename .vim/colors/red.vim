"--------------------------------------------------------------------
" Name Of File: red.vim.
" Installation: Drop this file in your $VIMRUNTIME/colors/ directory.
"--------------------------------------------------------------------

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="red"

"--------------------------------------------------------------------

hi Normal				ctermbg=234     ctermfg=254
hi Cursor				ctermbg=254 	ctermfg=16
hi Directory			                ctermfg=87
hi DiffAdd				ctermbg=21		ctermfg=220
hi DiffDelete			ctermbg=21 		ctermfg=60
hi DiffChange			ctermbg=21		ctermfg=255
hi DiffText			    ctermbg=21		ctermfg=160
hi ErrorMsg				          		ctermfg=88
hi Folded				                ctermfg=18
hi IncSearch			ctermbg=16		ctermfg=131
hi LineNr				                ctermfg=67
hi ModeMsg				ctermfg=255
hi MoreMsg				                ctermfg=83
hi NonText				                ctermfg=63
hi Question				ctermfg=220
hi SpecialKey			                ctermfg=67
hi StatusLine			ctermbg=23		ctermfg=255
hi StatusLineNC			ctermbg=145 	ctermfg=16
hi Title				ctermfg=255
hi Visual				ctermbg=145		ctermfg=16

" syntax highlighting groups ----------------------------------------

hi Comment				ctermfg=102
hi Constant				ctermfg=66 		cterm=bold
hi Identifier			ctermfg=255
hi PreProc				ctermfg=23
hi Type					ctermfg=24
hi Statement			ctermfg=24
hi Special 				ctermfg=66
hi Underlined			ctermfg=63 		cterm=bold		  
hi Ignore		 		ctermfg=59
hi Error				ctermfg=124
hi Todo					ctermfg=220 	ctermbg=124
hi Operator 			ctermfg=150
hi Function 	 	    ctermfg=33
hi String 				ctermfg=96


hi link Number    		Constant
hi link Boolean   		Constant
hi link Float     		Number
hi link Include   		PreProc
hi link Define    		PreProc
hi link Macro     		PreProc
hi link PreCondit 		PreProc
hi link Conditional 	Statement
hi link Label   		Statement
hi link Keyword   		Statement
hi link Exception 		Statement
hi link Repeat    		Statement
hi link StorageClass  	Type
hi link Structure 		Type
hi link Typedef   		Type
hi link Tag   			Special
hi link Delimiter 		Special
hi link SpecialComment  Special
hi link Debug   		Special
hi link FoldColumn  	Folded

"- end of colorscheme -----------------------------------------------	
