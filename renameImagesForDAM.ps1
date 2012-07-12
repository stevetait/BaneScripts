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
	
	# Gets all directories below the current directory
	$topLevelDirs = dir | Where { $_.psIsContainer -eq $true }
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Set prefix to Show name - top level directory name
		$showNamePrefix = $subDir
		
		$jpgFiles = Get-ChildItem -Path $subDir.FullName -Filter *.jpg -Recurse
		
		Foreach ($jpgFile In $jpgFiles)
				{
				
				# Check if a file exists
				If ($jpgFile)
					{
					
					$parentDirectory = Split-Path -leaf $jpgFile.DirectoryName
					
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$jpgFile"
						}
					else
						{
						$newFileName = "$showNamePrefix-$jpgFile"
						}
					
					
					$newFileName -replace " ","_"
					
					# Trim spaces and rename the file
					$image_string = $jpgFile.fullname.ToString().Trim()
					
					# Rename $jpgFile to $newFileName
					Rename-Item "$image_string" "$newFileName"
					
					}
				
				}
		
		$jpegFiles = Get-ChildItem -Path $subDir.FullName -Filter *.jpeg -Recurse
		
		Foreach ($jpegFile In $jpegFiles)
				{
				
				# Check if a file exists
				If ($jpegFile)
					{
					
					$parentDirectory = Split-Path -leaf $jpegFile.DirectoryName
					
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$jpegFile"
						}
					else
						{
						$newFileName = "$showNamePrefix-$jpegFile"
						}
					
					
					$newFileName -replace " ","_"
					
					# Trim spaces and rename the file
					$image_string = $jpegFile.fullname.ToString().Trim()
					
					# Rename $jpegFile to $newFileName
					Rename-Item "$image_string" "$newFileName"
					
					}
				
				}
		
		$gifFiles = Get-ChildItem -Path $subDir.FullName -Filter *.gif -Recurse
		
		Foreach ($gifFile In $gifFiles)
				{
				
				# Check if a file exists
				If ($gifFile)
					{
					
					$parentDirectory = Split-Path -leaf $gifFile.DirectoryName
					
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$gifFile"
						}
					else
						{
						$newFileName = "$showNamePrefix-$gifFile"
						}
					
					
					$newFileName -replace " ","_"
					
					# Trim spaces and rename the file
					$image_string = $gifFile.fullname.ToString().Trim()
					
					# Rename $gifFile to $newFileName
					Rename-Item "$image_string" "$newFileName"
					
					}
				
				}
		
		$bmpFiles = Get-ChildItem -Path $subDir.FullName -Filter *.bmp -Recurse
		
		Foreach ($bmpFile In $bmpFiles)
				{
				
				# Check if a file exists
				If ($bmpFile)
					{
					
					$parentDirectory = Split-Path -leaf $bmpFile.DirectoryName
					
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$bmpFile"
						}
					else
						{
						$newFileName = "$showNamePrefix-$bmpFile"
						}
					
					
					$newFileName -replace " ","_"
					
					# Trim spaces and rename the file
					$image_string = $bmpFile.fullname.ToString().Trim()
					
					# Rename $bmpFile to $newFileName
					Rename-Item "$image_string" "$newFileName"
					
					}
				
				}
		
		$pngFiles = Get-ChildItem -Path $subDir.FullName -Filter *.png -Recurse
		
		Foreach ($pngFile In $pngFiles)
				{
				
				# Check if a file exists
				If ($pngFile)
					{
					
					$parentDirectory = Split-Path -leaf $pngFile.DirectoryName
					
					if($showNamePrefix.Name.CompareTo($parentDirectory))
						{
						$newFileName = "$showNamePrefix-$parentDirectory-$pngFile"
						}
					else
						{
						$newFileName = "$showNamePrefix-$pngFile"
						}
					
					
					$newFileName -replace " ","_"
					
					# Trim spaces and rename the file
					$image_string = $pngFile.fullname.ToString().Trim()
					
					# Rename $pngFile to $newFileName
					Rename-Item "$image_string" "$newFileName"
					
					}
				
				}
		
		}
	
	}

# Run script
renameFiles