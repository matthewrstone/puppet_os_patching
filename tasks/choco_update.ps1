if (Test-Path 'C:\ProgramData\os_patching\outdated_choco_packages') {
    Write-Output @{message = "No outdated packages found."} | ConvertTo-Json
else {
    [Array]$content = Get-Content 'C:\ProgramData\os_patching\outdated_choco_packages'
    if $content.Count -gt 0 {
        foreach($item in $content) {
            & choco upgrade $item -y --no-progress --limit-output
        }    
    } else {
        Write-Output @{message = "No outdated packages found."} | ConvertTo-Json
    }
}
