$vmName = "vm" + (Get-Date -Format "yyyy-MM-dd-HH-mm")
New-VM -Name $vmName -NewVHDPath "$vmName.vhdx" -NewVHDSizeBytes 64GB -MemoryStartupBytes 8GB -Path $vmName -Generation 2

# Attach the Windows 10 ISO as a DVD drive to the VM
Add-VMDvdDrive -VMName $vmName -Path win.iso

# Set correct boot order (DVD drive first)
$dvd = Get-VMDVDDrive -VMName $vmName
Set-VMFirmware -VMName $vmName -FirstBootDevice $dvd

# Start the VM and connect to it
Start-VM -Name $vmName
vmconnect $env:COMPUTERNAME $vmName

# https://stackoverflow.com/q/61144238/2715716
