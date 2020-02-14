# HyperV

[**WEB**](https://tomashubelbauer.github.io/hyperv)

## Running

Open a new PowerShell prompt with administrator access and run `script.ps1`.

## Resources

https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/try-hyper-v-powershell

## To-Do

### Download and use NTLite to make bootable unattended ISO

`ntlite /?`

![](ntlite.png)

### Resolve the ISO DVD boot issue

https://stackoverflow.com/q/60233321/2715716
Actually this might be because a key is not held down during boot, I might be
able to solve it by doing the below - simulating mouse and keyboard input to the
VM.

### Simulare keyboard and mouse as an easier alternative to unattended install

https://stackoverflow.com/a/44764880/2715716

### Patch the ISO or find another way to make the installation unattended

**https://www.windowsafg.com/win10x86_x64_uefi.html**

Generate this file and store it with the repository, then figure out how to patch
the ISO file before mounting it to the VM so this file is included.

- https://stackoverflow.com/a/56869316/2715716
- https://hinchley.net/articles/update-an-iso-using-powershell
- https://gist.github.com/jonathanelbailey/c021fe5791d8baf42e7924215f2502cd
- https://devblogs.microsoft.com/scripting/use-powershell-to-create-a-bootable-usb-drive
- https://mikefrobbins.com/2018/01/18/use-powershell-to-create-a-bootable-usb-drive-from-a-windows-10-or-windows-server-2016-iso
- https://winaero.com/blog/powershell-windows-10-bootable-usb

---

- https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/automate-windows-setup
- https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs
- https://www.windowscentral.com/how-create-unattended-media-do-automated-installation-windows-10
- https://www.tenforums.com/tutorials/96683-create-media-automated-unattended-install-windows-10-a.html

#### Reuse the VM by making a snapshot after install and restoring after run

Could be either a VM per script or even a single Windows VM used by all scripts
which is snapshot once and then always restored to the previous state.

### Finalize creating and destroying Hyper-V Windows machines using PowerShell

- [ ] Install Windows 10 from the ISO in an unattended mode
- [ ] Configure the VM (copy/mount data and script, run script)
- [ ] Take out data from the VM
- [ ] Close and destroy the VM
- [ ] Measure how long all this takes

### Check this out

https://www.shahradjafari.com/batch-files-unattended-windows-installation-take-care-additional-work/
