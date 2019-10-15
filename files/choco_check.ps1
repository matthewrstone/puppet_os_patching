If (Test-Path C:\ProgramData\Chocolatey\Bin\choco.exe) {
    [System.Collections.ArrayList]$outdatedPackages
    [Array]$chocoOutput = (& choco outdated --limit-output --no-progress)
    foreach($line in $chocoOutput) { $outdatedPackages.Add($line.Split('|')[0]) }
}
[IO.File]::WriteAllLines('C:\ProgramData\os_patching\outdated_choco_packages', $outdatedPackages)
