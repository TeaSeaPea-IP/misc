# Developed by Gabriel Castillo for Medicus IT on 2023/08/27
#
# Version 1.0.0
#
# Description: this script will rename all files in a folder with the .PDF extension to the same name with the .pdf extension.
#

# Begin Script

############# DEFINE YOUR FOLDER PATH HERE ###########
$parentFolder = ""


$parentFolderDir = Get-ChildItem -Path $parentFolder | Where-Object -Property Extension -CEQ ".PDF"

# Script Logic Begin

# If Parent Folder Directory Tree contains files which match .PDF (case sensative) file extension
if($parentFolderDir){
    # Loop through all items in this directory
    foreach($file in $parentFolderDir){
        # Create the new file name
        $newName = $file -creplace ".PDF", ".pdf"

        # Try to rename the file
        try {
            Rename-Item -Path $file.fullName -NewName $newName

            # Output to console
            Write-Host UPDATED - $file.FullName -ForegroundColor Green
        }
        catch {
            #Do this if a terminating exception happens#
            Write-Host $_ -ForegroundColor Red
        }
    }
}

