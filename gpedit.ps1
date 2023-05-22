# REQ: Installs gpedit.msc. <eris 2023-05-21> 

# SEE: https://answers.microsoft.com/en-us/windows/forum/all/enable-gpeditmsc-in-home-edition/1c429a6d-2e45-4be1-bd2b-6106fa42ec7d <>

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# Set-PSDebug -Trace 2

$FileMasks = @(
	"Microsoft-Windows-GroupPolicy-ClientTools-Package",
	"Microsoft-Windows-GroupPolicy-ClientExtensions-Package"
)

$PathMasks = $FileMasks | % { "$env:SystemRoot\servicing\Packages\$_~*.mum" }	
$MumItems = Get-ChildItem -Path $PathMasks

$MumPaths = $MumItems | % { $_.FullName }

gsudo cache on

foreach ($MumPath in $MumPaths) {
	gsudo { DISM /Online /NoRestart /Add-Package:$($args[0]) } -Args $MumPath
}

gsudo cache off
