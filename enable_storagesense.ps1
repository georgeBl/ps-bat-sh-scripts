# Create the necessary registry keys
$storageSenseUserKey = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy"

if (!(Test-Path $storageSenseUserKey)) {
    New-Item -Path $storageSenseUserKey -Force
}

# Enable Storage Sense
New-ItemProperty -Path $storageSenseUserKey -Name "01" -Value 1 -PropertyType "DWord" -Force

# Set Storage Sense to run every day
New-ItemProperty -Path $storageSenseUserKey -Name "07" -Value 1 -PropertyType "DWord" -Force

# Configure Storage Sense to clean up the Downloads folder
New-ItemProperty -Path $storageSenseUserKey -Name "54" -Value 1 -PropertyType "DWord" -Force

# Set the number of days after which Storage Sense will delete files from the Downloads folder
$daysToDeleteFiles = 1
New-ItemProperty -Path $storageSenseUserKey -Name "08" -Value $daysToDeleteFiles -PropertyType "DWord" -Force
