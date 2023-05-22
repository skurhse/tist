# REQ: Installs applications with winget. <eris 2023-05-21>

# NOTE: Requires elevation. <> 

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# SEE: https://github.com/gerardog/gsudo#installation <>
winget install gerardog.gsudo 

# SEE: https://github.com/neovim/neovim/wiki/Installing-Neovim#winget <>
winget install Neovim.Neovim

# SEE: https://git-scm.com/download/win <>
winget install Git.Git -e --source winget
