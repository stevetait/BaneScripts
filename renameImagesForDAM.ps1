
$topLevelDirs = Split-Path -parent $MyInvocation.MyCommand.Definition

Function renameFiles
	{
	
	# topLevelDirs corresponds to Show directories
	$topLevelDirs = dir $topLevelPath | Where { $_.psIsContainer -eq $true }
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Set prefix to Show name - top level directory name
		$showNamePrefix = $subDir
		
		$files = Get-ChildItem -Path $subDir.FullName -Filter *.jpg -Recurse
		
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
					
					# Trim spaces and rename the file
					$image_string = $file.fullname.ToString().Trim()
					
					# Rename $file to $newFileName
					Rename-Item "$image_string" "$newFileName"
					
					}
				
				}
		
		}
	
	}

# Run script
renameFiles