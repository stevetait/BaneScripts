Function createPrinterPort
    {
    $ip = "10.0.1.120" 
    $port = [wmiclass]"Win32_TcpIpPrinterPort" 
    $port.psbase.scope.options.EnablePrivileges = $true 
    $newPort = $port.CreateInstance() 
    $newport.name = "IP_$ip" 
    $newport.Protocol = 1 
    $newport.HostAddress = $ip 
    $newport.PortNumber = "9100" 
    $newport.SnmpEnabled = $false 
    $newport.Put()
    }

createPrinterPort