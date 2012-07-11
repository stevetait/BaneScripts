
$topLevelDirs = Split-Path -parent $MyInvocation.MyCommand.Definition

Function renameFiles
	{
	
	# Prompt user for path of top level directory
	#Param(
		# Require user input
		#[Parameter(Mandatory=$true)]
		
		# Tests input to confirm valid path
		#[ValidateScript({Test-Path $_})]
		
		# Variable for user input of top level directory
		#[string]$topLevelPath
		#)
	
	# topLevelDirs corresponds to Show directories
	#$topLevelDirs = dir $topLevelPath | Where { $_.psIsContainer -eq $true }
	
	Foreach ($subDir In $topLevelDirs)
		{
		
		# Set prefix to Show name - top level directory name
		$showNamePrefix = $subDir
		
		# Get all jpg images within the top level directory and all subdirectories
		$files = Get-ChildItem -Path $subDir.FullName -Filter *.jpg -Recurse
		
		# DEBUG - Loop through images, output full path - WORKS AS INTENDED
		Foreach ($file In $files)
			{
			# Check if a file exists
			If ($file)
				{
				Write-Host $file.FullName
				}
			}
		
		# PRODUCTION - Output parent folder of each image - DOES NOT WORK
		Foreach ($file In $files)
			{
			# Check if a file exists
			If ($file)
				{
				$parentDirectory = Split-Path (Get-Item($file)) -parent
				
				# DEBUG - Output file path
				Write-Host $parentDirectory
				}
			}
		}
	
	}

# Run script
renameFiles