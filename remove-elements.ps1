#Get-ExecutionPolicy   run this command in powershell to see if your in restricted mode if so run Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#Press Win + S to open the Windows search bar.
#Type "environment variables" and select "Edit the system environment variables".
#In the System Properties window, click on the "Environment Variables" button on the bottom right of the popup.
#In the Environment Variables window, find the Path variable in the "System variables" section and click on "Edit".
#Click on "New" and add the directory path where your script is located. You can right click the script and click copy path if your on windows 11. But do not include the file itself in the path just the folder path in which it resides.
#Click on "OK" to close all windows.
# Prompt the user for the file path
$filePath = Read-Host "Enter the path to the file"
$modpath= $filePath -replace '"', ''
# Check if the file exists
if (Test-Path $modpath) {
    # Read the content of the file
    $content = Get-Content $modpath

    # Remove certain elements
    $elementsToRemove = Read-Host "Enter the elements to remove, separated by commas"
    $escapedElements = ($elementsToRemove -split ',' | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $newContent = $content -replace $escapedElements, ""

    # Write the modified content back to the file
    $outputDirectory= Read-Host "Enter the path of the output directory"
    $modoutputDirectory=$outputDirectory -replace '"', ''
    $outputFilePath = Join-Path -Path $modoutputDirectory -ChildPath "output.txt"
    $newContent | Set-Content $outputFilePath
    Write-Host "Modified content saved to $outputFilePath"
}