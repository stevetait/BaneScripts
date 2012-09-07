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
	
	# Sets $filter to the file extension passed to the renameFiles function
	Param($filter)
	
	# Gets all directories below the current directory
	$topLevelDirs = dir | Where { $_.psIsContainer -eq $true }
	
	# Loop through second-level directories
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Set prefix to Show name - top level directory name
		$showNamePrefix = $subDir
		
		# Get all files that match $filter
		$files = Get-ChildItem -Path $subDir.FullName -Filter $filter -Recurse
		
		# Loop through files
		Foreach ($file In $files)
				{
				
				# Check if a file exists
				If ($file)
					{
					
					# Gets immediate parent of $file
					$parentDirectory = Split-Path -leaf $file.DirectoryName
					
					$parentDirectory = $parentDirectory -replace "`'",""
					
					
					# If the top level directory and immediate parent are the same, don't duplicate the prefix
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$file"
						}
					else
						{
						$newFileName = "$showNamePrefix-$file"
						}
					
					# Replace spaces with underscores
					$newFileName = $newFileName -replace " ","_"
					
					$newFileName = $newFileName -replace "`'",""
					
					# Trim spaces of file path
					$imagePath = $file.fullname.ToString().Trim()
					
					# Add XMP Subject and Copyright tags
					exiftool "-xmp-dc:Subject=$showNamePrefix" "-xmp-dc:Rights=Copyright TAIT" -xmp-xmprights:marked=true -overwrite_original $file.FullName

					# Rename $file to $newFileName
					Rename-Item "$imagePath" "$newFileName"
					
					}
				
				}
		
		}
	
	}

# Run script, passing the extension filter as a parameter
renameFiles "*.jpg"
renameFiles "*.jpeg"
renameFiles "*.gif"
renameFiles "*.bmp"
renameFiles "*.png"
