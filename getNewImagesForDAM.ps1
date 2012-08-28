get-childitem "$jpegFolderPath" -include @("*.jpg","*.jpeg","*.bmp","*.gif","*.png") -recurse | Where-Object {$_.CreationTime -gt (Get-Date).AddDays(-31)} | Sort-Object -Property CreationTime