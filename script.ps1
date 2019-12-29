# Create the VM
$VM = @{
  Name               = "VM"
  MemoryStartupBytes = 2147483648
  Generation         = 2
  NewVHDPath         = "vm.vhdx"
  NewVHDSizeBytes    = 53687091200
  BootDevice         = "VHD"
  Path               = "vm"
  SwitchName         = (Get-VMSwitch).Name
}

New-VM @VM

# Download the Windows 10 ISO from the Microsoft website
Set-Location iso
npm install | Out-Null
npm start | Out-Default -OutVariable url
Set-Location ..
Write-Output $url
