
Function createPortAndPrinter($ipAddress, $driverPath, $driverName, $printerName)
    {
    $port = [wmiclass]"Win32_TcpIpPrinterPort" 
    $port.psbase.scope.options.EnablePrivileges = $true 
    $newPort = $port.CreateInstance() 
    $newport.name = "IP_$ipAddress" 
    $newport.Protocol = 1 
    $newport.HostAddress = $ipAddress 
    $newport.PortNumber = "9100" 
    $newport.SnmpEnabled = $false 
    $newport.Put()
    rundll32 printui.dll,PrintUIEntry /if /f "$driverPath" /r "IP_$ipAddress" /m "$driverName" /b "$printerName" /z
    }

createPortAndPrinter "10.0.1.206" "\\tait-fsit\disks\Printers\Win7x64\RicohC6501SP\oemsetup.inf" "PCL6 Driver for Universal Print" "2nd Floor Copier - Ricoh C6501SP"
createPortAndPrinter "10.0.1.119" "\\tait-fsit\disks\Printers\Win7x64\LanierLD365c\OEMSETUP.INF" "E-7200 PCL 6" "3rd Floor Copier - Lanier 365c"
createPortAndPrinter "10.0.1.134" "\\tait-fsit\disks\Printers\Win7x64\RicohMPC3500\RICSETUP.INF" "RICOH Aficio MP C3500 PS" "E-World  Copier - Ricoh MP C3500"