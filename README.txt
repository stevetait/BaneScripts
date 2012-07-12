# renameImagesForDAM.ps1 Script README.txt

# Purpose

This script is designed to append the top-level folder name and immediate parent folder name to the beginning of any image file found below the directory where the script is called

This means you will either have to navigate to the desired directory from the command line and then execute the script or copy the script to the desired location and execute it

The script currently handles .jpg .jpeg .gif .bmp .png, but can handle any extension by adding

renameFiles "*.xyz"

to the end of the file, where xyz is the desired extension.