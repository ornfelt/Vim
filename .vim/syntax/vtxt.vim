" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Kevin Lauder
" Latest Revision: 26 April 2008

if exists("b:current_syntax")
  finish
endif

"let b:current_syntax=vtxt

" Regions
"syn region vtxtElementRegion start='x' end='y'

syn region vtxtBlueRegion start='<b' end='>'
syn region vtxtCyanRegion start='<c' end='>'
syn region vtxtGreenRegion start='<g' end='>'
syn region vtxtPurpleRegion start='<p' end='>'
syn region vtxtRedRegion start='<r' end='>'
syn region vtxtOrangeRegion start='<o' end='>'
syn region vtxtYellowRegion start='<y' end='>'

syn region vtxtDateRegion start='<--' end='-->'
"syn match vtxtDot "[^\x00-\x7F]"
syn match vtxtDot "[^\u0020-\u007F\u00C0-\u00FF]"
syn match vtxtLine "--"
syn match vtxtStar "*"
syn match vtxtComment "#"
