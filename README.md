# HyperV

## Running

Open a new PowerShell prompt with administrator access.

## To-Do

### Try creating and destroying Hyper-V Windows machines using PowerShell

https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/try-hyper-v-powershell

- [x] Create the VM
- [ ] Download the Windows 10 ISO (in progress)
- [ ] Mount the ISO to the VM
- [ ] Install Windows 10 from the ISO
- [ ] Configure the VM (copy data and script, run script)
- [ ] Take out data from the VM
- [ ] Close and destroy the VM

Measure how long this will take as well.

### Wait for new ISO version and check if the FWLINK URL is the same

https://www.microsoft.com/en-us/software-download/windows10

Currently the URL is https://go.microsoft.com/fwlink/?LinkId=691209
It corresponds to `MediaCreationTool1909.exe`.

### Validate the Node based ISO downloaded works when I'm no longer rate limited

I seem to have triggered some limits now.

### Check out the options for controlling the Windows installer using the CLI

https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-setup-command-line-options
