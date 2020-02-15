If (!(Test-Path ntlite)) {
  If (!(Test-Path ntlite-installer.exe)) {
    Write-Output "Downloading the NTLite installer"
    Invoke-WebRequest -Uri http://downloads.ntlite.com/files/NTLite_setup_x64.exe -OutFile ntlite-installer.exe  
  }

  If (!(Test-Path inno.exe)) {
    Write-Output "Downloading innoextract"
    & .\inno.ps1
  }

  Write-Output "Extracting the NTLite installer"
  # Call with the .exe to beat the default precedence of .ps1
  .\inno.exe ntlite-installer.exe
  Remove-Item ntlite-installer.exe
  Remove-Item inno.exe
  Move-Item app ntlite
}
