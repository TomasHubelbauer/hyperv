# Download the Windows 10 ISO from the Microsoft website unless already present
$isoName = "win.iso"
If (!(Test-Path $isoName)) {
  $urlName = "win.url"
  If (!(Test-Path $urlName)) {
    Write-Output "Scraping Windows 10 ISO download URL"
    # TODO: Report a rate limit error on error here
    $winIsoUrl = $(npx https://github.com/TomasHubelbauer/win-iso-url)
  }
  Else {
    Write-Output "Windows 10 ISO download URL already scraped"
    $winIsoUrl = Get-Content $urlName
  }

  Write-Output "Downloading Windows 10 ISO"
  Write-Output $winIsoUrl  

  # TODO: Refetch in case downloading the potentially stale URL from the file doesn't work
  Invoke-WebRequest $winIsoUrl -OutFile $isoName
}
Else {
  Write-Output "Windows 10 ISO already downloaded"
}

$isoUnattendedName = "win-unattended.iso"
If (!(Test-Path $isoUnattendedName)) {
  Write-Output "Obtaining NTLite"
  exit
}
Else {
  Write-Output "Windows 10 ISO unattended already converted"
}

$vmName = "vm"

# TODO: Remove this when setting up the VM and installing Windows is completed
$vm = Get-VM | Where-Object {$_.Name -eq $vmName}
If ($vm) {
  Write-Output "Removing Windows 10 VM"
  Stop-VM -Name $vmName -Force -Confirm:$false
  Remove-VM -Name $vmName -Force -Confirm:$false
  Remove-Item -Path $vmName -Force -Recurse -Confirm:$false
}

$vm = Get-VM | Where-Object {$_.Name -eq $vmName}
If (!$vm) {
  # Create the Windows 10 VM if it doesn't exist already
  Write-Output "Creating Windows 10 VM"

  # TODO: See if I need to add `-MemoryStartupBytes 4GB` or if the default 512MB will suffice
  # TODO: See if I need to add `-SwitchName (Get-VMSwitch).Name` to access the Internet
  New-VM -Name $vmName -NewVHDPath "$vmName.vhdx" -NewVHDSizeBytes 64GB -MemoryStartupBytes 8GB -Path $vmName -Generation 2

  # TODO: Remove this - tried to see if not booting was caused by low minimal memory (512MB) in dynamic memory mode
  Set-VMMemory -VMName $vmName -DynamicMemoryEnabled $false

  # Attach the Windows 10 ISO as a DVD drive to the VM
  Add-VMDvdDrive -VMName $vmName -Path $isoName

  # Set correct boot order (DVD drive first)
  $dvd = Get-VMDVDDrive -VMName $vmName
  Set-VMFirmware -VMName $vmName -FirstBootDevice $dvd
}
Else {
  Write-Output "Windows 10 VM already created"
}

Write-Output "Staring Windows 10 VM"
Start-VM -Name $vmName

Write-Output "Connecting to Windows VM"
vmconnect $env:COMPUTERNAME $vmName
