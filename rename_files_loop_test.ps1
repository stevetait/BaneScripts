
Function renameFiles
	{
	
	# Prompt user for path of top level directory
	Param(
		# Require user input
		[Parameter(Mandatory=$true)]
		
		# Tests input to confirm valid path
		[ValidateScript({Test-Path $_})]
		
		# Variable for user input of top level directory
		[string]$topLevelPath
		)
	
	# DEBUG - Output top level directory
	Write-Host "Top Level Directory: $topLevelPath"
	
	# topLevelDirs corresponds to Show directories
	$topLevelDirs = dir $topLevelPath | Where { $_.psIsContainer -eq $true }
	
	# Index of top level directories - REPLACE WITH SPLIT ON FULL PATH??
	$i = 0
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Set prefix to Show name - top level directory name
		$showNamePrefix = $subDir
		
		# DEBUG - Output Show directory name
		Write-Host "     $topLevelPath \ $showNamePrefix"
		
		
		# dirs corresponds to all subdirectories 
		#$dirs = dir $subDir.fullname -Recurse | Where { $_.psIsContainer -eq $true }
		
		Foreach ($directory In $subDir)
			{
			# DEBUG - Output subdirectory name
			#Write-Host "          $topLevelPath \ $subDir \ $directory"
			
			$files = Get-ChildItem -Path $directory.fullname -Filter *.jpg -Recurse
			
			Foreach ($file In $files)
				{
				# Check if a file exists
				If ($file)
					{
					# DEBUG - Output file path
					Write-Host "          $topLevelPath \ $subDir \ $directory \ $file"
					}
				}
			}
		}
	
	}

# Run script
renameFiles