if !has('conceal')
  finish
endif

" Original file is https://github.com/wjakob/wjakob.vim/blob/master/after/syntax/tex.vim

" more reasonably sized symbols that were already defined
syn match texMathSymbol '\\Rightarrow\>' contained conceal cchar=⇒
syn match texMathSymbol '\\Leftarrow\>' contained conceal cchar=⇐
syn match texMathSymbol '\\rightarrow\>' contained conceal cchar=→
syn match texMathSymbol '\\leftarrow\>' contained conceal cchar=←
syn match texMathSymbol '\\emptyset\>' contained conceal cchar=Ø
syn match texMathSymbol '\\varphi\>' contained conceal cchar=φ
"syn match texMathSymbol '\\phi\>' contained conceal cchar=Φ " different with '\Phi' ?
syn match texMathSymbol '\\langle\>\s*' contained conceal cchar=⟨
syn match texMathSymbol '\s*\\rangle\>' contained conceal cchar=⟩

" logical symbols
syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬
syn match texMathSymbol '\\implies\>' contained conceal cchar=⇒
syn match texMathSymbol '\\impliedby\>' contained conceal cchar=⇐
syn match texMathSymbol '\\geqslant\>' contained conceal cchar=⩾
syn match texMathSymbol '\\leqslant\>' contained conceal cchar=⩽

" \mathbb characters
syn match texMathSymbol '\\C\>' contained conceal cchar=ℂ
syn match texMathSymbol '\\N\>' contained conceal cchar=ℕ
"syn match texMathSymbol '\\Q\>' contained conceal cchar=ℚ
syn match texMathSymbol '\\R\>' contained conceal cchar=ℝ
"syn match texMathSymbol '\\Z\>' contained conceal cchar=ℤ

syn match texSpecialChar '\\#' contained conceal cchar=#

syn match texStatement '\\\\' contained conceal cchar=⏎
syn match texStatement '``' contained conceal cchar=“
syn match texStatement +''+ contained conceal cchar=”
syn match texStatement '\\item\>' contained conceal cchar=•
syn match texStatement '\\ldots\>' contained conceal cchar=…
syn match texStatement '\\quad\>' contained conceal cchar=  
syn match texStatement '\\qquad\>' contained conceal cchar=    
"syn match texStatement '\\\[' contained conceal cchar=⟦
"syn match texStatement '\\\]' contained conceal cchar=⟧
syn match texDelimiter '\\{' contained conceal cchar={
syn match texDelimiter '\\}' contained conceal cchar=}
syn match texMathSymbol '\\setminus\>' contained conceal cchar=\
syn match texMathSymbol '\\coloneqq\>' contained conceal cchar=≔
syn match texMathSymbol '\\colon\>' contained conceal cchar=:
" syn match texMathSymbol '\s' contained conceal
syn match texMathSymbol '\\:' contained conceal cchar= 
syn match texMathSymbol '\\;' contained conceal cchar= 
syn match texMathSymbol '\\,' contained conceal cchar= 
syn match texMathSymbol '\\ ' contained conceal cchar= 
syn match texMathSymbol '\\quad\>' contained conceal cchar=  
syn match texMathSymbol '\\qquad\>' contained conceal cchar=    
syn match texMathSymbol '\\sqrt\>\s*' contained conceal cchar=√
syn match texMathSymbol '\\sqrt\[3]' contained conceal cchar=∛
syn match texMathSymbol '\\sqrt\[4]' contained conceal cchar=∜
syn match texMathSymbol '\\\!' contained conceal
syn match texMathSymbol '\\where\>' contained conceal cchar=|
syn match texMathSymbol '\\square\>' contained conceal cchar=□
syn match texMathSymbol '\\qedhere\>' contained conceal cchar=□

if get(g:, 'tex_conceal_frac', 0)
  syn match texMathSymbol '\\[dt]\?frac\%(1\|{1}\)\%(2\|{2}\)' contained conceal cchar=½
  syn match texMathSymbol '\\[dt]\?frac\%(1\|{1}\)\%(3\|{3}\)' contained conceal cchar=⅓
  syn match texMathSymbol '\\[dt]\?frac\%(2\|{2}\)\%(3\|{3}\)' contained conceal cchar=⅔
  syn match texMathSymbol '\\[dt]\?frac\%(1\|{1}\)\%(4\|{4}\)' contained conceal cchar=¼
  syn match texMathSymbol '\\[dt]\?frac\%(1\|{1}\)\%(5\|{5}\)' contained conceal cchar=⅕
  syn match texMathSymbol '\\[dt]\?frac\%(2\|{2}\)\%(5\|{5}\)' contained conceal cchar=⅖
  syn match texMathSymbol '\\[dt]\?frac\%(3\|{3}\)\%(5\|{5}\)' contained conceal cchar=⅗
  syn match texMathSymbol '\\[dt]\?frac\%(4\|{4}\)\%(5\|{5}\)' contained conceal cchar=⅘
  syn match texMathSymbol '\\[dt]\?frac\%(1\|{1}\)\%(6\|{6}\)' contained conceal cchar=⅙
  syn match texMathSymbol '\\[dt]\?frac\%(5\|{5}\)\%(6\|{6}\)' contained conceal cchar=⅚
  syn match texMathSymbol '\\[dt]\?frac\%(1\|{1}\)\%(8\|{8}\)' contained conceal cchar=⅛
  syn match texMathSymbol '\\[dt]\?frac\%(3\|{3}\)\%(8\|{8}\)' contained conceal cchar=⅜
  syn match texMathSymbol '\\[dt]\?frac\%(5\|{5}\)\%(8\|{8}\)' contained conceal cchar=⅝
  syn match texMathSymbol '\\[dt]\?frac\%(7\|{7}\)\%(8\|{8}\)' contained conceal cchar=⅞
end

" hide \text delimiter etc inside math mode
if !exists("g:tex_nospell") || !g:tex_nospell
  syn region texMathText matchgroup=texStatement start='\\\%(\%(inter\)\=mathrm\)\s*{'     end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
  syn region texMathText matchgroup=texStatement start='\\\%(\%(inter\)\=text\|mbox\)\s*{' end='}' concealends keepend contains=@texFoldGroup,@Spell containedin=texMathMatcher
  syn region texMathText matchgroup=texStatement start='\\fbox\s*{' end='}' contains=@texFoldGroup,@Spell containedin=texMathMatcher
else
  syn region texMathText matchgroup=texStatement start='\\\%(\%(inter\)\=text\|mbox\|mathrm\)\s*{' end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
  syn region texMathText matchgroup=texStatement start='\\fbox\s*{' end='}' contains=@texFoldGroup containedin=texMathMatcher
endif

syn region texBoldMathText  matchgroup=texStatement start='\\\%(mathbf\|bm\|symbf\|pmb\|boldsymbol\){' end='}' concealends contains=@texMathZoneGroup containedin=texMathMatcher
syn region texMathOperName  matchgroup=texTypeStyle start='\\\%(operatorname\*\?\|math\%(op\|bin\)\){'  skip="\\[\\{}]" end='}'  contained concealends contains=@texMathZoneGroup
syn cluster texMathZoneGroup add=texBoldMathText,texMathOperName

syn region texBoldItalStyle matchgroup=texTypeStyle start="\\emph\s*{" end="}" concealends contains=@texItalGroup
syn region texItalStyle  matchgroup=texTypeStyle start="\\emph\s*{" end="}" concealends contains=@texItalGroup

hi texBoldMathText cterm=bold gui=bold

" set ambiwidth=single

" -> TeX fonts; 
" -> applied only to letters in {}; to format "\mathbb R" etc.: 
"  :%s/\\math\a\{2,4}\zs\s\+\(\a\)/{\1}/gec
syn cluster texMathZoneGroup add=texFont,texMathFont
syn cluster texFoldGroup add=texFont
syn cluster texMatchGroup add=texFont
fun s:texFontCharConceal(mathonly,cmd,syncname,patStr,ccharStr)
  if a:mathonly
    exe 'syn region texMathFont matchgroup=texTypeStyle start="\\'..a:cmd..'\s*{"  skip="\\[\\{}]" end="}"  contained concealends contains=@texMathZoneGroup,'..a:syncname..' containedin=texMathMatcher'
  else
    exe 'syn region texFont matchgroup=texTypeStyle start="\\'..a:cmd..'\s*{"  skip="\\[\\{}]" end="}" concealends contains=@texFoldGroup,'..a:syncname..' containedin=texMathMatcher'
  endif
  for l:i in range(len(a:patStr))
    exe "syn match "..a:syncname.." '"..a:patStr[l:i].."' contained conceal cchar="..a:ccharStr[byteidx(a:ccharStr,l:i):byteidx(a:ccharStr,l:i+1)-1]
    " -> a:ccharStr usually unicode array
  endfor
endfun
call s:texFontCharConceal(0,'textsc','texFontSmCap','abcdefghijklmnopqrstuvwxyz','ᴀʙᴄᴅᴇꜰɢʜɪᴊᴋʟᴍɴᴏᴘǫʀsᴛᴜᴠᴡxʏᴢ')
call s:texFontCharConceal(1,'mathfrak','texFontFrak','ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷')
call s:texFontCharConceal(1,'math\%(scr\|cal\)','texFontScr','ABCDEFGHIJKLMNOPQRSTUVWXYZ','𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩')
call s:texFontCharConceal(1,'mathbb','texFontBlackBoard','ABCDEFGHIJKLMNOPQRSTUVWXYZ','𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ')
call s:texFontCharConceal(0,'texttt','texFontTeletype','ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣')
call s:texFontCharConceal(1,'mathtt','texFontTeletype','','')
call s:texFontCharConceal(0,'textsf','texFontSansSerif','ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓')
call s:texFontCharConceal(1,'mathsf','texFontSansSerif','','')

" -> super/sub-scripts
let s:tex_superscripts=get(g:, 'tex_superscripts', '[0-9a-pr-zABDEG-PRTUW() \-=+,:;./<>]')
let s:tex_subscripts=get(g:, 'tex_subscripts', '[0-9aeh-pr-vx() \-=+.,/]')
fun s:SuperSubChar(leader,patStr,ccharStr)
  if a:leader=='\^'
    let l:group='texSuperscript'
    let l:allowed=s:tex_superscripts
  elseif a:leader=='_'
    let l:group='texSubscript'
    let l:allowed=s:tex_subscripts
  endif
  for l:i in range(len(a:patStr))
    if a:patStr[l:i] !~# l:allowed
      continue
    endif
    let l:cchar=a:ccharStr[byteidx(a:ccharStr,l:i):byteidx(a:ccharStr,l:i+1)-1]
    exe "syn match "..l:group.." '"..a:leader..a:patStr[l:i].."' contained conceal cchar="..l:cchar
    exe "syn match "..l:group.."s '"..a:patStr[l:i].."' contained conceal cchar="..l:cchar
  endfor
endfun
let s:SuperCmdList = []
let s:SubCmdList = []
fun s:SuperSubCmd(leader,cmd,cchar)
  if a:leader=='\^'
    let l:group='Super'
  elseif a:leader=='_'
    let l:group='Sub'
  endif
  call add({"s:"..l:group.."CmdList"}, a:cmd)
  exe 'syn match tex'..l:group..'script "'..a:leader..'\\'..a:cmd..'\>" contained conceal cchar='..a:cchar
  exe 'syn match tex'..l:group..'scripts "\\'..a:cmd..'\>" contained conceal cchar='..a:cchar
endfun

call s:SuperSubChar('\^','0123456789abcdefghijklmnoprstuvwxyzABDEGHIJKLMNOPRTUW+-<>/()=,:;','⁰¹²³⁴⁵⁶⁷⁸⁹ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻᴬᴮᴰᴱᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾᴿᵀᵁᵂ⁺⁻˂˃ˊ⁽⁾˭︐︓︔')
syn match texSuperscript '\^\.' contained conceal cchar=˙
syn match texSuperscripts '\.' contained conceal cchar=˙
call s:SuperSubCmd('\^','vee','ᵛ')
call s:SuperSubCmd('\^','\%(top\|intercal\)','ᵀ')
call s:SuperSubCmd('\^','\%(ast\|star\|times\)','˟')
call s:SuperSubCmd('\^','alpha','ᵅ')
call s:SuperSubCmd('\^','beta','ᵝ')
call s:SuperSubCmd('\^','gamma','ᵞ')
call s:SuperSubCmd('\^','delta','ᵟ')
call s:SuperSubCmd('\^','epsilon','ᵋ')
call s:SuperSubCmd('\^','theta','ᶿ')
call s:SuperSubCmd('\^','iota','ᶥ')
call s:SuperSubCmd('\^','[pP]hi','ᶲ')
"call s:SuperSubCmd('\^','\%(var\)\?phi','ᵠ')
call s:SuperSubCmd('\^','varphi','ᵠ')
call s:SuperSubCmd('\^','chi','ᵡ')
"call s:SuperSubCmd('\^','nu','ᵛ')
exe 'syn match texSuperscript "\^{\%('..s:tex_superscripts..'\|\\\%('..join(s:SuperCmdList,'\|')..'\)\>\)\+}" contained conceal contains=texSuperscripts'

syn match texMathSymbol '\^\%(\\math\%(rm\|sf\){\s*-\?T\s*}\|{\s*-\?\s*\\math\%(rm\|sf\){\s*-\?T\s*}\s*}\)' contained conceal contains=texSuperscripts,texStatement
exe 'syn match texMathSymbol "\^\%(\\\%(text\|mathrm\|mbox\){'..s:tex_superscripts..'\+}\|{\s*\\\%(text\|mathrm\|mbox\){'..s:tex_superscripts..'\+}\s*}\)" contained conceal contains=texSuperscripts,texStatement'

call s:SuperSubChar('_','0123456789aehijklmnoprstuvx+-/()=,','₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ₊₋ˏ₍₎₌,')
syn match texSubscript '_\.' contained conceal cchar=.
syn match texSubscripts '\.' contained conceal cchar=.
call s:SuperSubCmd('_','beta','ᵦ')
call s:SuperSubCmd('_','rho','ᵨ')
call s:SuperSubCmd('_','\%(var\)\?phi','ᵩ')
call s:SuperSubCmd('_','gamma','ᵧ')
call s:SuperSubCmd('_','chi','ᵪ')
"call s:SuperSubCmd('_','nu','ᵥ')
call s:SuperSubCmd('_','cdot','.')
call s:SuperSubCmd('_','[cl]\?dots','…')
exe 'syn match texSubscript "_{\%('..s:tex_subscripts..'\|\\\%('..join(s:SubCmdList,'\|')..'\)\>\)\+}" contained conceal contains=texSubscripts'
exe 'syn match texMathSymbol "_\%(\\\%(text\|mathrm\|mbox\){'..s:tex_subscripts..'\+}\|{\s*\\\%(text\|mathrm\|mbox\){'..s:tex_subscripts..'\+}\s*}\)" contained conceal contains=texSubscripts,texStatement'
