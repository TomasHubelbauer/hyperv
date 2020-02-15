If (!(Test-Path win-unattended.iso)) {
  If (!(Test-Path 7z.exe) -Or !(Test-Path 7z.dll)) {
    & ./7zip.ps1
  }
  
  If (!(Test-Path iso)) {
    ./7z x win.iso -oiso -y
  }
}

cd ntlite
& ./NTLite.exe /LoadImage:../win.iso /ImageIndex:6 /LoadPreset:todo /CreateIso:../win-unattended.iso /IsoLabel:"Windows 10 Unattended" /ExitAfter:1
cd ..
