# Copyright (c) 2025, Vedschyburger 🍔
# MIT License
# All rights reserved.
# My Github: https://github.com/Vedschyburger
#
# This code may be freely used and modified for personal use, but may not be sold or published in a modified form. The above copyright and license text must remain unchanged and the main owner (Vedschyburger) must be explicitly mentioned in the modified code. Any changes to the code must be clearly documented. Run this script as administrator
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
# to deal in the Software without restriction, including without limitation the rights to use, copy, modify, and merge the Software, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# NO LIABILITY IS ACCEPTED FOR ANY DAMAGE OR LOSS OF DATA RESULTING FROM THE USE OF THIS CODE.
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# This PowerShell code deletes certain folders from the specified directory if they exist. 
# It checks whether the folders “cache”, “server-cache” and “server-cache-priv” exist in the directory “C:\Users\Administrator\AppData\Local\FiveM\FiveM.app\data” and removes them together with their contents. 
# If folders are missing, a corresponding message is displayed.
# If FiveM is not installed on the C: hard disk, the path must be adjusted accordingly.
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Path to the folders to be deleted
$BasePath = "C:\Users\Administrator\AppData\Local\FiveM\FiveM.app\data"

# List of folders to be deleted
$FolderList = @("cache", "server-cache", "server-cache-priv")

# Iterate through each folder in the list
foreach ($Folder in $FolderList) {
    # Create the full path by combining the base path with the folder name
    $FullPath = Join-Path -Path $BasePath -ChildPath $Folder
    
    # Check if the folder exists at the full path
    if (Test-Path -Path $FullPath) {
        # Delete the folder and its contents
        Remove-Item -Path $FullPath -Recurse -Force
        Write-Host "Folder deleted: $FullPath"
    } else {
        # Inform that the folder was not found
        Write-Host "Folder not found: $FullPath"
    }
}
