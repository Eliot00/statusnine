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

if exists('g:LOADED_STATUSNINE') || v:version < 802
    finish
endif
g:LOADED_STATUSNINE = true

import autoload 'statusnine.vim'
import autoload 'statusnine/colorscheme.vim' as colorscheme

augroup statusnine
    autocmd!
    autocmd WinEnter,BufEnter,SessionLoadPost,FileChangedShellPost * call Init()
    autocmd Colorscheme * call colorscheme.ColorSchemeInit()
augroup END

def Init()
    set laststatus=2
    set statusline=%{%statusnine#Statusline()%}
enddef
