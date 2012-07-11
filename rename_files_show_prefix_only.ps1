
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
					$newFileName = "$showNamePrefix_$file.Name"
					
					Write-Host $newFileName
					
					}
				
				}
				
		}
	
	}

# Run script
renameFiles