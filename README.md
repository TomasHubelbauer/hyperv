# HyperV

[**WEB**](https://tomashubelbauer.github.io/hyperv)

## Running

Open a new PowerShell prompt with administrator access and run `script.ps1`.

## Resources

https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/try-hyper-v-powershell

## To-Do

### Await activity on the SO question

https://stackoverflow.com/q/61144238/2715716

### Check out https://github.com/smourier/VIM2VHD

Also https://gallery.technet.microsoft.com/scriptcenter/Convert-WindowsImageps1-0fe23a8f

And https://deploymentbunny.com/2013/12/19/powershell-is-king-convert-wim-to-vhdvhdx-with-support-for-gen-1-and-gen-2-biosuefi-and-then-some/

### Try next steps:

1. Finish NTLite unattended script `unattend.ps1`
  - I did a manual NTLite configuration and exported the preset in `preset.xml`
  - It's unclear how to make it automatically select the sole disk for full unattendedness
  - The VM installed from `win-unattended.iso` made manually freezes during login
  - It's unclear if I can make the Administrator used password blank (might be causing the freeze)
  - It's unclear if since I'm removing unused editions the index should be 6 or 0
  - It's unclear whether it is safe to post the now-scrubbed UUIDs in `preset.xml`
    - The original file is in `iso/preset.xml`
2. Try to fix automated botting to the ISO by sending a space bar press to the VM
   - Otherwise it skips past the *Press any key to boot* screen and fails to boot
   - It might be possible to do that thru Hyper-V PS commands or Hyper-V WMI
   - Since the VM connection is RDP it might also be possible to do using RDP
   - Or maybe Windows API could be used to send a fake keypress to the VM window
   - More on Hyper-V simulation here: https://stackoverflow.com/a/44764880/2715716

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

https://www.shahradjafari.com/batch-files-unattended-windows-installation-take-care-additional-work
