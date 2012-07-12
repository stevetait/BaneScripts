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

	# Gets all directories below the current directory
	$topLevelDirs = dir -r | Where { $_.psIsContainer -eq $true }
	
	# Loop through subdirectories
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Check if Folder Exists
		If ($subDir)
			{
			# Gets full folder path
			$folderPath = $subDir.fullname.ToString().Trim()
			
			# Gets only folder name
			$oldFolderName = $subDir.name

			# Create variable from folder name to perform rename operations upon
			$newFolderName = $subDir.name
			
			# Remove dots points in folder name
			$newFolderName = $newFolderName.Replace(".","")
			
			# Remove exlamation points in folder name
			$newFolderName = $newFolderName.Replace("!","")
			
			# Debug - output path, old name, new name
			#Write-Host "Folder Path: $folderPath"
			#Write-Host "Old Folder Name: $oldFolderName"
			#Write-Host "New Folder Name: $newFolderName"
			
			# Test if folder name has been changed
			if($oldFolderName.CompareTo($newFolderName))
				{
				# Rename $subDir to $newFileName
				Rename-Item "$folderPath" "$newFolderName"
				
				# Debug - ouput old and new name
				#Write-Host "Rename Folder from: $oldFolderName"
				#Write-Host "Rename Folder   to: $newFolderName"
				}
			}
		}
	}

# Run script
renameFolders
