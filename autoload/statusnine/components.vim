vim9script
#    Copyright (C) 2022  Elliot<hack00mind@gmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published
#    by the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Hope Vim9 supports class as soon as possible.

export def CurrentMode(): string
    return '%#NineMode# ' .. modeIconMap->get(mode(), 'Unknown') .. '%#NineModeRight#'
enddef

export def FileName(): string
    if empty(expand('%:t'))
        return ''
    endif
    return '%#NineFileName# '
        .. IsFileReadonly()
        .. fnamemodify(expand("%"), ":~:.")
        .. IsFileModified()
        .. ' %#NineFileNameRight#'
enddef

export def Gutter(): string
    return '%#NineGutter#%=%#NineGutterRight#'
enddef

export def FileInfo(): string
    return '%#NineFileInfo# %{&fileencoding?&fileencoding:&encoding} | %{&fileformat} %#NineFileInfoRight#'
enddef

export def CursorInfo(): string
    return '%#NineCursorInfo# %p%% | %l:%c '
enddef

def IsFileReadonly(): string
    if &readonly
        return ' '
    endif
    return ''
enddef

def IsFileModified(): string
    if &modified
        return ' '
    endif
    return ''
enddef

const modeIconMap: dict<string> = {
    n: "🅝 ",
    v: "🅥 ",
    V: "🅥 ",
    ["\<C-V>"]: "🅥 ",
    i: "🅘 ",
    R: "🅡 ",
    s: "🅢 ",
    t: "🅣 ",
    c: "🅒 ",
    ["!"]: "SE",
}
