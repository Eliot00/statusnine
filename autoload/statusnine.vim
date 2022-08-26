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

import autoload 'statusnine/colorscheme.vim' as colorscheme

export def Statusline(): string
    colorscheme.ColorSchemeInit()
    return CurrentMode()
        .. FileName()
        .. '%#NineGutter#%=%#NineGutterRight#'
        .. FileInfo()
        .. ''
        .. CursorInfo()
enddef

def CurrentMode(): string
    return '%#NineMode# ' .. modeIconMap->get(mode(), 'Unknown') .. '%#NineModeRight#'
enddef

def FileName(): string
    return '%#NineFileName# %f %#NineFileNameRight#'
enddef

def FileInfo(): string
    return '%#NineFileInfo# %{&fileencoding?&fileencoding:&encoding} | %{&fileformat}%#NineFileInfoRight#'
enddef

def CursorInfo(): string
    return '%#NineCursorInfo# %p%% | %l:%c '
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
