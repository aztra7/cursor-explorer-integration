# PowerShell Script: add_cursor_context.ps1
# Adds "Open in Cursor" to right-click context menu in Windows Explorer

$cursorPath = "$env:LOCALAPPDATA\Programs\Cursor\Cursor.exe"

if (-Not (Test-Path $cursorPath)) {
    Write-Host "❌ Cursor.exe not found at: $cursorPath"
    Write-Host "➡️ Please update the script with the correct path to Cursor.exe."
    exit
}

$cursorEscaped = $cursorPath -replace '\\', '\\\\'

$regContent = @"
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\Open in Cursor]
@="Open in Cursor"
"Icon"="$cursorEscaped"

[HKEY_CLASSES_ROOT\Directory\Background\shell\Open in Cursor\command]
@="cmd.exe /c cursor ."

[HKEY_CLASSES_ROOT\Directory\shell\Open in Cursor]
@="Open in Cursor"
"Icon"="$cursorEscaped"

[HKEY_CLASSES_ROOT\Directory\shell\Open in Cursor\command]
@="cmd.exe /c cursor \"%1\""
"@

$tempRegFile = "$env:TEMP\add_cursor_context.reg"
$regContent | Out-File -Encoding ASCII -FilePath $tempRegFile

# Import the registry file with admin rights
Start-Process regedit.exe -ArgumentList "/s `"$tempRegFile`"" -Verb RunAs

Write-Host "✅ Context menu entry 'Open in Cursor' added successfully!"
