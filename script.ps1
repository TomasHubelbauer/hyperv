# Download the Windows 10 ISO from the Microsoft website unless already present
$isoName = "win.iso"
If (!(Test-Path win.iso)) {
  If (!(Test-Path win.url)) {
    Write-Output "Scraping Windows 10 ISO download URL"
    # TODO: Report a rate limit error on error here
    $winIsoUrl = $(npx https://github.com/TomasHubelbauer/win-iso-url)
  }
  Else {
    Write-Output "Windows 10 ISO download URL already scraped"
    $winIsoUrl = Get-Content win.url
  }

  Write-Output "Downloading Windows 10 ISO"
  Write-Output $winIsoUrl  

  # TODO: Refetch in case downloading the potentially stale URL from the file doesn't work
  Invoke-WebRequest $winIsoUrl -OutFile $isoName
}
Else {
  Write-Output "Windows 10 ISO already downloaded"
}

$vmName = "vm"

# TODO: Remove this when setting up the VM and installing Windows is completed
$vm = Get-VM | Where-Object {$_.Name -eq $vmName}
If ($vm) {
  Write-Output "Removing Windows 10 VM"
  Remove-VM -Name $vmName -Force -Confirm:$false
  Remove-Item -Path $vmName -Force -Recurse -Confirm:$false
}

$vm = Get-VM | Where-Object {$_.Name -eq $vmName}
If (!$vm) {
  # Create the Windows 10 VM if it doesn't exist already
  Write-Output "Creating Windows 10 VM"

  # TODO: See if I need to add `-MemoryStartupBytes 2GB` or if the 512MB will suffice
  # TODO: See if I need to add `-SwitchName (Get-VMSwitch).Name` to access the Internet
  New-VM -Name $vmName -NewVHDPath "$vmName.vhdx" -NewVHDSizeBytes 2GB -Path $vmName -Generation 2

  # Attach the Windows 10 ISO as a DVD drive to the VM
  Add-VMDvdDrive -VMName $vmName -Path $isoName
}
Else {
  Write-Output "Windows 10 VM already created"
}
