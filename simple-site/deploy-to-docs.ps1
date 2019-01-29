Param (
    [Switch]$Clean = $fales
)
## Deploy to Docs
# The purpose of this script is to automate coppying the contents of the src folder to the docs folder.

Write-Output "Deploy to Docs should be run from the parent directory of the`nsrc directory you want to copy to docs."
Write-Output "If you want to also remove existing content (except CNAME), pass parameter -Clean"



Set-Variable -Name SIMPLE_SITE_PATH -Value $(Get-Location)
## Sets the location to the parent folder
Set-Location -Path ..

## Gets the Absolute Path do the docs folder
Set-Variable -Name DOCS_PATH -Value "$(Get-Location)\docs"

## Test to make srue the docs folder exists
if (-Not (Test-Path -Path $DOCS_PATH))
{
    Write-Output "Docs folder does not exist!"
    exit 1
}

# Changes the location to the docs folder
Push-Location -Path $DOCS_PATH
# Checks if there is anything in the docs folder, ignoring the "CNAME" file
Set-Variable -Name DOCS_FILES -Value $(Get-ChildItem -Exclude "CNAME" -Name)

# Test if files already exist
Set-Variable -Name "FILES_EXIST" -Value $false
if ($($DOCS_FILES | Measure-Object).Count -ne 0 ) {
    Set-Variable -Name FILES_EXIST -Value $true
}

# Only runs if there are files besides CNAME in docs
if ($Clean -and $FILES_EXIST) {
    Write-Output "Cleanning up docs"
    Remove-Item -Path $DOCS_PATH -Exclude "CNAME" -Verbose -Recurse -Force
    Set-Variable -Name FILES_EXIST -Value $false
}

Set-Location -Path $SIMPLE_SITE_PATH

if ($FILES_EXIST) {
    Write-Output "docs folder has more files than CNAME!`nPlease remove additional files:`n"
    foreach ($fileName in @($DOCS_FILES)) {
        Write-Output $fileName
    }
    exit 1
}



Write-Output "Coppying src to docs..."

# Coppies everything from the src directory to the docs directory
Copy-Item "$SIMPLE_SITE_PATH\src\*" -Destination "$DOCS_PATH" -Recurse -Verbose
