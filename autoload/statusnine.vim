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
        .. '%#Gutter#%=%#GutterRight#'
        .. FileInfo()
        .. ''
        .. CursorInfo()
enddef

def CurrentMode(): string
    return '%#HomeMode# ' .. modeMap->get(mode(true), 'NORMAL') .. ' %#HomeModeRight#'
enddef

def FileName(): string
    return ' %f %#FileNameRight# '
enddef

def FileInfo(): string
    return '%#FileInfo# %{&fileencoding?&fileencoding:&encoding} | %{&fileformat}%#FileInfoRight#'
enddef

def CursorInfo(): string
    return ' %#CursorInfo#%p%% | %l:%c '
enddef

const modeMap: dict<string> = {
    n:          'NORMAL',
    niI:        'I-NORMAL',
    niR:        'R-NORMAL',
    niV:        'R-NORMAL',
    v:          'VISUAL',
    V:          'V-LINE',
    ["\<C-V>"]: 'V-BLOCK',
    s:          'SELECT',
    S:          'S-LINE',
    ["\<C-S>"]: 'S-BLOCK',
    i:          'INSERT',
    R:          'REPLACE',
    t:          'TERMINAL',
    [':']:      'COMMAND',
    ['>']:      'DEBUG',
    ['/']:      'SEARCH',
    ['?']:      'SEARCH',
    ['@']:      'PROMPT',
    ['-']:      'EX-INSERT',
    ['=']:      'EXPR',
    c:          'Command',
    cv:         'Ex',
    ce:         'Ex',
}
