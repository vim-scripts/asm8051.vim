" Vim syntax file
" Hacked by Keith, from the x86 asm syntax, which was from the 68000 asm syntax....
"  x Language:	8051 Assembler (IAR flavor)
"  x Maintainer:
" Last change:	2006 Sep 22
 
" Adapted from asm8051 file which was apparently derived
" from the 68000 asm syntax

" Directives and such are probably IAR specific.  Feel free to expand for Keil
" and/or SDCC assemblers

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Preprocessor
syn match   asm8051PreProc	"^\s*#\s*\(\(if\(n\=\(def\)\)\=\)\|\(end\(if\)\=\)\|\(define\)\|\(error\)\|\(else\)\)\>"
syn match   asm8051PreProc	"^\s*#\s*include\>\s*["<]" contains=asmx86Included
syn match   asm8051PreProc	"$\S*"
syn match   asm8051Included	contained "["<][^"]*[>"]"

" Comments
syn region  asm8051Comment	start=";" end="$" contains=asmx86Todo
syn region  asm8051Commentcpp	start="\s*#\s*if\s\+0\+\>" end="\s*#\s*endif\>" contains=asmx86Todo
syn region  asm8051Commentcxx	start="//" end="$" contains=asmx86Todo
syn region  asm8051Commentc	start="/\*" end="\*/" contains=asmx86Todo
syn keyword asm8051Todo		contained TODO ToDo XXX FIX FIXME CHANGED

" Valid labels
syn match   asm8051Label	"^[a-z_?.][a-z0-9_?.$]*[:]*$"

" Various number formats
syn match   hexNumber		"0x[0-9a-fA-F]\+\>"
" syn match hexNumber		"\<[0-9][0-9a-fA-F]*H\>"
" syn match octNumber		"@[0-7]\+\>"
" syn match octNumber		"\<[0-7]\+[QO]\>"
" syn match binNumber		"%[01]\+\>"
" syn match binNumber		"\<[01]\+B\>"
" syn match decNumber		"\<[0-9]\+D\=\>"

" -- Registers --
" Register set(s)
syn match   asm8051Reg		"[Rr][0-7]"

" SFRs
syn keyword asm8051Reg		a b psw dps dptr dpl dph dpl1 dph1 

" -- 8051 opcodes --
" Arithmetic Operations
syn match   asm8051Opcode	"\<add[c]*\>"
syn match   asm8051Opcode	"\<subb\>"
syn match   asm8051Opcode	"\<inc\>"
syn match   asm8051Opcode	"\<dec\>"
syn match   asm8051Opcode	"\<mul\>"
syn match   asm8051Opcode	"\<div\>"
syn match   asm8051Opcode	"\<da\>"

" Logic Operations
syn match   asm8051Opcode	"\<anl\>"
syn match   asm8051Opcode	"\<orl\>"
syn match   asm8051Opcode	"\<xrl\>"
syn match   asm8051Opcode	"\<clr\>"
syn match   asm8051Opcode	"\<cpl\>"
syn match   asm8051Opcode	"\<r[rl][c]*\>"
syn match   asm8051Opcode	"\<swap\>"

" Data Transfer Operations
syn match   asm8051Opcode	"\<mov[cx]*\>"
syn match   asm8051Opcode	"\<push\>"
syn match   asm8051Opcode	"\<pop\>"
syn match   asm8051Opcode	"\<xch{d]*\>"

" Program Branch Operations
syn match   asm8051Opcode	"\<[al]call\>"
syn match   asm8051Opcode	"\<ret{i]*\>"
syn match   asm8051Opcode	"\<[als]*jmp\>"
syn match   asm8051Opcode	"\<j[n]*[zcb]\>"
syn match   asm8051Opcode	"\<jbc\>"
syn match   asm8051Opcode	"\<cjne\>"
syn match   asm8051Opcode	"\<djnz\>"
syn match   asm8051Opcode	"\<nop\>"

" Boolean Operations
syn match   asm8051Opcode	"\<setb\>"
" all other boolean operations are coverd in other sections
" op codes are the same, just arguments are different


" -- Operators --
syn match   asm8051Operator	"\<SIZEOF\>"
syn match   asm8051Operator	"<<"		" shifts
syn match   asm8051Operator	">>"
syn match   asm8051Operator	"\<SH[RL]\>"
syn match   asm8051Operator	"&"		" and
syn match   asm8051Operator	"&&"
syn match   asm8051Operator	"\<BITAND\>"
syn match   asm8051Operator	"\<AND\>"
syn match   asm8051Operator	"|"		" or
syn match   asm8051Operator	"||"
syn match   asm8051Operator	"\<BITOR\>"
syn match   asm8051Operator	"\<OR\>"
syn match   asm8051Operator	"\^"		" xor
syn match   asm8051Operator	"\<BITXOR\>"
syn match   asm8051Operator	"\<XOR\>"
syn match   asm8051Operator	"\~"		" not
syn match   asm8051Operator	"!"
syn match   asm8051Operator	"\<BITNOT\>"
syn match   asm8051Operator	"\<NOT\>"
syn match   asm8051Operator	"<>"		" inequality
syn match   asm8051Operator	"!="
syn match   asm8051Operator	"\<NE\>"
syn match   asm8051Operator	">"
syn match   asm8051Operator	"<"
syn match   asm8051Operator	">="
syn match   asm8051Operator	"<="
syn match   asm8051Operator	"\<GT\>"
syn match   asm8051Operator	"\<LT\>"
syn match   asm8051Operator	"\<GE\>"
syn match   asm8051Operator	"\<LE\>"
syn match   asm8051Operator	"\<UGT\>"
syn match   asm8051Operator	"\<ULT\>"
syn match   asm8051Operator	"="             " equality
syn match   asm8051Operator	"=="
syn match   asm8051Operator	"\<EQU\>"
syn match   asm8051Operator	"+"
syn match   asm8051Operator	"-"
syn match   asm8051Operator	"\*"
syn match   asm8051Operator	"/[^*/]"
syn match   asm8051Operator	"%"
syn match   asm8051Operator	"\<MOD\>"
syn match   asm8051Operator	"\<LOW\>"
syn match   asm8051Operator	"\<HIGH\>"
syn match   asm8051Operator	"\<BYTE[234]\>"
syn match   asm8051Operator	"\<[LH]WRD\>"
syn match   asm8051Operator	"\<DATE\>"
syn match   asm8051Operator	"\<LOC\>"
syn match   asm8051Operator	"\<PRM\>"
syn match   asm8051Operator	"\<SF[BE]\>"

" -- Directives --
" Module Control
syn match   asm8051Directive	"\<NAME\s"
syn match   asm8051Directive	"\<MODULE\>"
syn match   asm8051Directive	"\<END\(MOD\)*\>"
syn match   asm8051Directive	"\<LIBRARY\>"
syn match   asm8051Directive	"\<PROGRAM\>"
syn match   asm8051Directive	"\<RTMODEL\>"

" Symbol Control
syn match   asm8051Directive	"\<EXTE*RN\>"
syn match   asm8051Directive	"\<IMPORT\>"
syn match   asm8051Directive	"\<PUBLIC\>"
syn match   asm8051Directive	"\<EXPORT\>"
syn match   asm8051Directive	"\<PUBWEAK\>"
syn match   asm8051Directive	"\<REQUIRE\>"

" Segment Control
syn match   asm8051Directive	"\<ALIGN\(RAM\)*\s"
syn match   asm8051Directive	"\<[AR]SEG[N]*\s"
syn match   asm8051Directive	"\<COMMON\s"
syn match   asm8051Directive	"\<EVEN\>"
syn match   asm8051Directive	"\<ODD\>"
syn match   asm8051Directive	"\<ORG\s"
syn match   asm8051Directive	"\<STACK\s"

" Value Assignment
syn match   asm8051Directive	"="
syn match   asm8051Directive	"\<EQU\s"
syn match   asm8051Directive	"\<ALIAS\s"
syn match   asm8051Directive	"\<ASSIGN\s"
syn match   asm8051Directive	"\<DEFINE\s"
syn match   asm8051Directive	"\<LIMIT\s"
syn match   asm8051Directive	"\<SET\s"
syn match   asm8051Directive	"\<SFR\(TYPE\)*\s"

" Conditional Assembly
syn match   asm8051Cond		"\<IF\>"
syn match   asm8051Cond		"\<ELSE\>"
syn match   asm8051Cond		"\<ELSEIF\>"
syn match   asm8051Cond		"\<ENDIF\>"

" Macro Processing
syn match   asm8051Macro	"\<MACRO\>"
syn match   asm8051Macro	"\<LOCAL\s"
syn match   asm8051Macro	"\<EXITM\>"
syn match   asm8051Macro	"\<ENDM\(AC\)*\>"
syn match   asm8051Macro	"\<REPT[IC]*\>"
syn match   asm8051Macro	"\<ENDR\>"
syn match   asm8051MacroParam	"\\[0-9]"

" Structured Assembly
syn match   asm8051Directive	"\<BREAK\>"
syn match   asm8051Directive	"\<CASE\>"
syn match   asm8051Directive	"\<CONTINUE\>"
syn match   asm8051Directive	"\<DEFAULT\>"
syn match   asm8051Directive	"\<ELSE\(IF\)*S\>"
syn match   asm8051Directive	"\<END[SW]\>"
syn match   asm8051Directive	"\<FOR\s"
syn match   asm8051Directive	"\<IFS\s"
syn match   asm8051Directive	"\<REPEAT\>"
syn match   asm8051Directive	"\<SWITCH\>"
syn match   asm8051Directive	"\<UNTIL\s"
syn match   asm8051Directive	"\<WHILE\s"

" Data Definition/Allocation
syn match   asm8051Directive	"\<D[BDSTW]\s"
syn match   asm8051Directive	"\<D[CS]\(\(8\)\|\(16\)\|\(24\)\|\(32\)\)\s"

syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm8051_syntax_inits")
  if version < 508
    let did_asm8051_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  " Comment Constant Error Identifier PreProc Special Statement Todo Type
  "
  " Constant		Boolean Character Number String
  " Identifier		Function
  " PreProc		Define Include Macro PreCondit
  " Special		Debug Delimiter SpecialChar SpecialComment Tag
  " Statement		Conditional Exception Keyword Label Operator Repeat
  " Type		StorageClass Structure Typedef

  HiLink asm8051Comment		Comment
  HiLink asm8051Commentcpp	Comment
  HiLink asm8051Commentc	Comment
  HiLink asm8051Commentcxx	Comment
  HiLink asm8051Todo		Todo

  HiLink hexNumber		Number		" Constant
"  HiLink octNumber		Number		" Constant
"  HiLink binNumber		Number		" Constant
"  HiLink decNumber		Number		" Constant

  HiLink asm8051Label		Type
  HiLink asm8051Reg		Identifier
  HiLink asm8051Operator	Identifier

  HiLink asm8051Macro		Macro		" PreProc
  HiLink asm8051MacroParam	Keyword		" Statement
  HiLink asm8051PreProc		PreProc		" PreProc
  HiLink asm8051Included	String		" PreProc

  HiLink asm8051Directive	Special
  HiLink asm8051Opcode		Keyword
  HiLink asm8051Cond		Conditional	" Statement

  delcommand HiLink
endif

let b:current_syntax = "asm8051"

" vim: ts=8 sw=2
