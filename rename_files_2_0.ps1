$path = Split-Path -parent $MyInvocation.MyCommand.Definition

Function renameFiles
	{
	# Loop through only top level directories
	$topLevelDirs = dir $path | Where { $_.psIsContainer -eq $true }

	# Added index for top level directories
	$j = 0

	Foreach ($subDir In $topLevelDirs)
		{
		# Loop through all directories
		$dirs = dir $subDir -Recurse | Where { $_.psIsContainer -eq $true }

		Foreach ($dir In $dirs)
			{
			# Set default value for addition to file name
			$i = 1
	
			#added '$topLevelDirs[$j].name + "_" + ' to append grandparent folder name
			$newdir = $topLevelDirs[$j].name + "_" + $dir.name + "_"

			# Search for the files - REMOVED FILTER
			$files = Get-ChildItem -Path $dir.fullname -Filter *.jpg -Recurse
				
			Foreach ($file In $files)
				{
				# Check if a file exists
				If ($file)
					{
					
						if ($file.Attributes -ne "Directory")
						{
			
						# Split the name and rename it to the parent folder
						$split    = $file.name.split(".jpg")
						$replace  = $split[0] -Replace $split[0],($newdir + $i + ".jpg")

						# Trim spaces and rename the file
						$image_string = $file.fullname.ToString().Trim()
						"$split[0] renamed to $replace"
						Rename-Item "$image_string" "$replace"
						$i++
						}
					
					}
				}
			}

		# Added increment index of top level directories
		$j++

		}

	}

# RUN SCRIPT
renameFiles
"SCRIPT FINISHED"