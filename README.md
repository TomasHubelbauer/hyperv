# HyperV

[**WEB**](https://tomashubelbauer.github.io/hyperv)

## Running

Open a new PowerShell prompt with administrator access and run `script.ps1`.

## To-Do

### Patch the ISO or find another way to make the installation unattended

**https://www.windowsafg.com/win10x86_x64_uefi.html**

Generate this file and store it with the repository, then figure out how to patch
the ISO file before mounting it to the VM so this file is included.

- https://stackoverflow.com/a/56869316/2715716
- https://hinchley.net/articles/update-an-iso-using-powershell
- https://gist.github.com/jonathanelbailey/c021fe5791d8baf42e7924215f2502cd

---

- https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/automate-windows-setup
- https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs
- https://www.windowscentral.com/how-create-unattended-media-do-automated-installation-windows-10
- https://www.tenforums.com/tutorials/96683-create-media-automated-unattended-install-windows-10-a.html

#### Reuse the VM by making a snapshot after install and restoring after run

Could be either a VM per script or even a single Windows VM used by all scripts
which is snapshot once and then always restored to the previous state.

### Try creating and destroying Hyper-V Windows machines using PowerShell

https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/try-hyper-v-powershell

- [ ] Mount the ISO to the VM
- [ ] Install Windows 10 from the ISO
- [ ] Configure the VM (copy/mount data and script, run script)
- [ ] Take out data from the VM
- [ ] Close and destroy the VM

Measure how long all this will take.

### Wait for new ISO version and check if the FWLINK URL is the same

https://www.microsoft.com/en-us/software-download/windows10

Currently the URL is https://go.microsoft.com/fwlink/?LinkId=691209
It corresponds to `MediaCreationTool1909.exe`.

### Check out the options for controlling the Windows installer using the CLI

https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-setup-command-line-options
