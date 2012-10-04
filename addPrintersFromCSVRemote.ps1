$computerName = $args[0]

New-PSDrive SharedLocation FileSystem \\tait-fsit\Disks\PrinterDeployment\

invoke-command -computername $computerName -authentication CredSSP -credential TAITTOWERS\Administrator -FilePath "\\tait-fsit\Disks\PrinterDeployment\addCopiersFromCSV.ps1"