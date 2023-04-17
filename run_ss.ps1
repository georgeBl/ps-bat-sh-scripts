# Get list of all local users
$localUsers = Get-LocalUser

# Loop through all local users and delete contents of their Downloads folder
foreach ($user in $localUsers) {
    # Get user's Downloads folder path
    $downloadsFolder = "C:\Users\$($user.Name)\Downloads\"

    # Delete all files and subdirectories in the Downloads folder
    Get-ChildItem $downloadsFolder -Force | Remove-Item -Recurse -Force
}