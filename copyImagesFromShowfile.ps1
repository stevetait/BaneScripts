#######################################################################################
# AUTHOR  : Steve Baney
# 
#
#######################################################################################

Function moveShowfileImages
	{
	
	#Param($filter)
	
	#Set working directory to showfile
	
	# Gets all directories below the current directory
	$topLevelDirs = dir | Where { $_.psIsContainer -eq $true }
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Get full path of show folder
		#$subdirPath = $subDir.FullName
		
		# Debug - output full path of $subDir		
		#"$subdirPath"
		
		#$subDirName = $subdir.Name
		
		# Debug - output name of $subDir		
		"$subDirName"
		
		# Append path to \IMAGES\JPEG subfolder to path
		$jpegFolderPath = Join-Path $subDir.FullName "\IMAGES\JPEG"
		
		# Debug - output full path with \IMAGES\JPEG added
		#"$jpegFolderPath"
		
		if(Test-Path $jpegFolderPath)
			{
			# Create Output Path
			$outputPath = Join-Path "X:\PhotosForImport\SHOWFILE" $subDir.Name
			
			# Debug - output $outputPath
			#"$outputPath"
			
			get-childitem "$jpegFolderPath" -include @("*.jpg","*.jpeg","*.bmp","*.gif","*.png") -recurse | copy-item -destination {$newpath=$_.PSParentPath -replace [regex]::escape($jpegFolderPath), "$outputPath"; new-item -path $newpath -type directory -ea SilentlyContinue | out-null; write-output $newpath}
			
			}
			
		}
	
	}

# Run script
moveShowfileImages

# Attempting to handle all filetypes from within function...
#moveShowfileImages "*.jpg"
#moveShowfileImages "*.jpeg"
#moveShowfileImages "*.gif"
#moveShowfileImages "*.bmp"
#moveShowfileImages "*.png"