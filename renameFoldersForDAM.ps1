#######################################################################################
# AUTHOR  : Steve Baney
# 
# ORIGINAL - Marius - http://www.hican.nl – 
# (http://gallery.technet.microsoft.com/scriptcenter/PowerShell-Rename-Files-b1268678)
#
# COMMENT : 
#
#
#######################################################################################

Function renameFolders
	{
	
	Param($filter)
	
	# Gets all directories below the current directory
	$topLevelDirs = dir -r | Where { $_.psIsContainer -eq $true }
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Gets full folder path
		$folder_string = $subDir.fullname.ToString().Trim()
		
		Write-Host "Original Name: $folder_string"
		
		$dirName = $subDir.name
		
		$dirName = $dirName.Replace(".","")
		
		$dirName = $dirName.Replace("!","")
		
		Write-Host $dirName
		
		# Rename $subDir to $newFileName
		# Rename-Item "$folder_string" "$dirName"
		}
	
	}

# Run script
renameFolders
