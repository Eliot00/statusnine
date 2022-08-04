vim9script

export def ColorSchemeInit()
    hi NineMode guifg=#dfdfe0 guibg=#81b29a
    hi NineModeRight guifg=#81b29a guibg=#d8d8d8
    hi NineFileName guifg=#183d5b guibg=#d8d8d8
    hi NineFileNameRight guifg=#d8d8d8 guibg=#e0e0e0
    hi NineGutter guibg=#e0e0e0
    hi NineGutterRight guifg=#183d5b guibg=#e0e0e0
    hi NineFileInfo guifg=#dfdfe0 guibg=#183d5b
    hi NineFileInfoRight guifg=#6bb3c6 guibg=#183d5b
    hi NineCursorInfo guifg=#e0e0e0 guibg=#6bb3c6
enddef
