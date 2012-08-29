#######################################################################################
# AUTHOR  : Steve Baney
# 
#
#######################################################################################

Function moveShowfileImages
	{
	
	#Param($filter)
	
	#Set working directory to showfile
	Set-Location "D:\DAMworking"
	
	$parentDir = [Environment]::CurrentDirectory=(Get-Location -PSProvider FileSystem).ProviderPath
	#"Parent Directory: $parentDir"
	
	# Gets all directories below the current directory
	$childDirs = dir | Where { $_.psIsContainer -eq $true }
	
	Foreach ($childDir In $childDirs)
		{

		Set-Location $childDir.FullName
		
		$currentChildDir = [Environment]::CurrentDirectory=(Get-Location -PSProvider FileSystem).ProviderPath
		
		#"     Child Directory: $currentChildDir"
		
		# Gets all directories below the current directory
		$grandChildDirs = dir | Where { $_.psIsContainer -eq $true }
		
		Foreach ($grandChildDir In $grandChildDirs)
			{
			# Get full path of show folder
			Set-Location $grandChildDir.FullName
			
			$currentGrandChildDir = [Environment]::CurrentDirectory=(Get-Location -PSProvider FileSystem).ProviderPath
		
			#"          Grandchild Directory: $currentGrandChildDir"
			
			# Append \IMAGES\JPEG subfolder to path
			$imagesJpegFolderPath = Join-Path $grandChildDir.FullName "\IMAGES\JPEG"
			
			# Append \JPEGS subfolder to path
			$jpegsFolderPath = Join-Path $grandChildDir.FullName "\JPEGS"
			
			if(Test-Path $imagesJpegFolderPath)
				{
				#"$imagesJpegFolderPath"
				
				# Create Output Path
				$outputPath = Join-Path "X:\PhotosForImport\ARCHIVE" $currentGrandChildDir.Name
				
				# Debug - output $outputPath
				#"$outputPath"
				
				get-childitem "$imagesJpegFolderPath" -include @("*.jpg","*.jpeg","*.bmp","*.gif","*.png") -recurse | copy-item -destination {$newpath=$_.PSParentPath -replace [regex]::escape($imagesJpegFolderPath), "$outputPath"; new-item -path $newpath -type directory -ea SilentlyContinue | out-null; write-output $newpath}
				}
			elseif(Test-Path $jpegsFolderPath)
				{
				"$jpegsFolderPath"
				
				# Create Output Path
				$outputPath = Join-Path "X:\PhotosForImport\ARCHIVE" $currentGrandChildDir.Name
				
				# Debug - output $outputPath
				#"$outputPath"
				
				get-childitem "$jpegsFolderPath" -include @("*.jpg","*.jpeg","*.bmp","*.gif","*.png") -recurse | copy-item -destination {$newpath=$_.PSParentPath -replace [regex]::escape($jpegsFolderPath), "$outputPath"; new-item -path $newpath -type directory -ea SilentlyContinue | out-null; write-output $newpath}
				}

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