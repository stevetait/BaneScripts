# BaneScripts README.txt

# renameImagesForDAM.ps1 Script

# Purpose

This script is designed to append the top-level folder name and immediate parent folder name to the beginning of any image file found below the directory where the script is called.

# Location of files to be renamed

This means you will either have to navigate to the desired directory from the command line and then execute the script or copy the script to the desired location and execute it.

In the future I would like to add an option for the user to input the directory as a parameter, but this works fine for now.

# File types handled

The script currently handles .jpg .jpeg .gif .bmp .png, but can handle any extension by adding

renameFiles "*.xyz"

to the end of the file, where xyz is the desired extension.

# getFileExtensions.ps1 Script

#Purpose

This script is designed to output all the file extensions found below the directory where the script is called

# Location of files

This means you will either have to navigate to the desired directory from the command line and then execute the script or copy the script to the desired location and execute it.

In the future I would like to add an option for the user to input the directory as a parameter, but this works fine for now.