" Airline color scheme for @nickng
let g:airline#themes#nickng#palette = {}

let s:black = 16
let s:white = 231
let s:guiblack = '#000000'
let s:guiwhite = '#ffffff'

let s:darkestgreen = 22
let s:darkgreen = 28
let s:green = 2
let s:mediumgreen = 70
let s:brightgreen = 148
let s:guidarkestgreen = '#005f00'
let s:guidarkgreen = '#008700'
let s:guimediumgreen = '#5faf00'
let s:guibrightgreen = '#afd700'

let s:darkestcyan = 23
let s:darkcyan = 74
let s:mediumcyan = 117
let s:brightcyan = 159
let s:guidarkestcyan = '#005f5f'
let s:guidarkcyan = '#5fafd7'
let s:guimediumcyan = '#87d7ff'
let s:guibrightcyan = '#afffff'

let s:darkestblue = 24
let s:darkblue = 31
let s:guidarkestblue = '#005f87'
let s:guidarkblue = '#0087af'

let s:red = 1
let s:darkestred = 52
let s:darkred = 88
let s:mediumred = 124
let s:brightred = 160
let s:brightestred = 196
let s:guidarkestred = '#5f0000'
let s:guidarkred = '#870000'
let s:guimediumred = '#af0000'
let s:guibrightred = '#d70000'
let s:brightestred = '#ff0000'

let s:darkestpurple = 55
let s:mediumpurple = 98
let s:brightpurple = 189
let s:guidarkestpurple = '#5f00af'
let s:guimediumpurple = '#875fd7'
let s:guibrightpurple = '#d7d7ff'

let s:darkorange = 94
let s:mediumorange = 166
let s:brightorange = 208
let s:brightestorange = 214
let s:guidarkorange = '#875f00'
let s:guimediumorange = '#d75f00'
let s:guibrightorange = '#ff8700'
let s:guibrightestorange = '#ffaf00'

let s:yellow = 11
let s:brightyellow = 220
let s:guibrightyellow = '#ffd700'

let s:gray0 = 233
let s:gray1 = 235
let s:gray2 = 236
let s:gray3 = 239
let s:gray4 = 240
let s:gray5 = 241
let s:gray6 = 244
let s:gray7 = 245
let s:gray8 = 247
let s:gray9 = 250
let s:gray10 = 252
let s:gray11 = 234
let s:gray90 = 254
let s:guigray0 = '#121212'
let s:guigray1 = '#262626'
let s:guigray2 = '#303030'
let s:guigray3 = '#4e4e4e'
let s:guigray4 = '#585858'
let s:guigray5 = '#626262'
let s:guigray6 = '#808080'
let s:guigray7 = '#8a8a8a'
let s:guigray8 = '#9e9e9e'
let s:guigray9 = '#bcbcbc'
let s:guigray10 = '#d0d0d0'
let s:guigray11 = '#1c1c1c'
let s:guigray90 = '#1c1c1c'

let s:lightyellowgreen = 106
let s:gold3 = 178
let s:orangered = 202
let s:steelblue = 67
let s:darkorange3 = 166
let s:skyblue1 = 117
let s:khaki1 = 228
let s:guilightyellowgreen = '#87af00'
let s:guigold3 = '#d7af00'
let s:guiorangered = '#ff5f00'
let s:guisteelblue = '#5f87af'
let s:guidarkorange3 = '#d75f00'
let s:guiskyblue1 = '#87d7ff'
let s:guikhaki1 = '#ffff87'


" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.
let s:N1 = [ s:guiwhite, s:guidarkblue, s:white, s:darkblue, "bold" ]
let s:N2 = [ s:guigray9, s:guigray4,    s:gray9,    s:gray4 ]
let s:N3 = [ s:guiwhite, s:guigray4,    s:white,    s:gray4 ]
let g:airline#themes#nickng#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#nickng#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#nickng#palette.normal_modified = {
      \ 'airline_c': [ s:guibrightyellow, s:guigray4, s:brightyellow, s:gray4, '' ],
      \ }

let s:I1 = [ s:guidarkestcyan, s:guiwhite, s:darkestcyan, s:white, 'bold' ]
let s:I2 = [    s:guidarkcyan,  '#005faf',    s:darkcyan,      25 ]
let s:I3 = [       s:guiwhite, s:guigray4,       s:white, s:gray4 ]
let g:airline#themes#nickng#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#nickng#palette.insert_modified = {
      \ 'airline_c': [ s:guibrightyellow, s:guigray4, s:brightyellow, s:gray4, '' ],
      \ }
let g:airline#themes#nickng#palette.insert_paste = {
      \ 'airline_a': [ s:guiwhite, s:guimediumorange, s:white, s:mediumorange, '' ],
      \ }

let g:airline#themes#nickng#palette.replace = copy(g:airline#themes#nickng#palette.insert)
let g:airline#themes#nickng#palette.replace.airline_a = [ '#ffffff', '#d70000', 231, 160, 'bold' ]
let g:airline#themes#nickng#palette.replace_modified = g:airline#themes#nickng#palette.insert_modified

let s:V1 = [ s:guidarkorange, s:guibrightestorange, s:darkorange, s:brightestorange , 'bold' ]
let s:V2 = [ s:guibrightestorange, s:guidarkorange, s:brightestorange, s:darkorange ]
let s:V3 = [ s:guiwhite, s:guigray4, s:white, s:gray4 ]
let g:airline#themes#nickng#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#nickng#palette.visual_modified = {
      \ 'airline_c': [ s:guibrightyellow, s:guigray4, s:brightyellow, s:gray4, '' ],
      \ }

let s:IA1 = [ s:guigray3, s:guigray11, s:gray3, s:gray11, '' ]
let s:IA2 = [ s:guigray3,  s:guigray1, s:gray3,  s:gray1, '' ]
let s:IA3 = [ s:guigray3,  s:guigray2, s:gray3,  s:gray2, '' ]
let g:airline#themes#nickng#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#nickng#palette.inactive_modified = {
      \ 'airline_c': [ s:guigray5, '', s:gray5, '', 'bold' ],
      \ }

let g:airline#themes#nickng#palette.accents = {
      \ 'red': [ s:guibrightred, '' , s:brightred, ''  ]
      \ }

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#nickng#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:guibrightpurple, s:guidarkestpurple, s:brightpurple, s:darkestpurple, ''     ],
      \ [        s:guiwhite,  s:guimediumpurple,        s:white,  s:mediumpurple, ''     ],
      \ [ s:guidarkestpurple,        s:guiwhite, s:darkestpurple,        s:white, 'bold' ])
