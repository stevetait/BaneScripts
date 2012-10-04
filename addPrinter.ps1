$printerIP = $args[0]


Function createBrother4150
    {
    $port = [wmiclass]"Win32_TcpIpPrinterPort" 
    $port.psbase.scope.options.EnablePrivileges = $true 
    $newPort = $port.CreateInstance() 
    $newport.name = "IP_$printerIP" 
    $newport.Protocol = 1 
    $newport.HostAddress = $printerIP 
    $newport.PortNumber = "9100" 
    $newport.SnmpEnabled = $false 
    $newport.Put()
    rundll32 printui.dll,PrintUIEntry /if /f \\tait-fsit\disks\Printers\Win7x64\BrotherHL-4150CDN\BR4150_2.INF /r "IP_$printerIP" /m "Brother HL-4150CDN BR-Script3" /n "New Printer"
    }

createBrother4150