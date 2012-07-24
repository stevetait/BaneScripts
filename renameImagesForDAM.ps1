#######################################################################################
# AUTHOR  : Steve Baney
# 
# ORIGINAL - Marius - http://www.hican.nl – 
# (http://gallery.technet.microsoft.com/scriptcenter/PowerShell-Rename-Files-b1268678)
#
# COMMENT : This script renames all .jpg .jpeg .bmp .gif .png 
# files to "top level folder - parent folder - original filename"
#
#######################################################################################

Function renameFiles
	{
	
	Param($filter)
	
	# Gets all directories below the current directory
	$topLevelDirs = dir | Where { $_.psIsContainer -eq $true }
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Set prefix to Show name - top level directory name
		$showNamePrefix = $subDir
		
		$files = Get-ChildItem -Path $subDir.FullName -Filter $filter -Recurse
		
		Foreach ($file In $files)
				{
				
				# Check if a file exists
				If ($file)
					{
					
					$parentDirectory = Split-Path -leaf $file.DirectoryName
					
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$file"
						}
					else
						{
						$newFileName = "$showNamePrefix-$file"
						}
					
					
					$newFileName -replace " ","_"
					
					# Trim spaces of file path
					$imagePath = $file.fullname.ToString().Trim()
					
					# Add XMP Subject tag
					exiftool "-xmp-dc:Subject=$showNamePrefix" -overwrite_original $file.FullName
					
					# Rename $file to $newFileName
					Rename-Item "$imagePath" "$newFileName"
					
					}
				
				}
		
		}
	
	}

# Run script
renameFiles "*.jpg"
renameFiles "*.jpeg"
renameFiles "*.gif"
renameFiles "*.bmp"
renameFiles "*.png"
