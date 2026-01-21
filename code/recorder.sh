cargo install --git https://github.com/russelltg/wl-screenrec --force
paru -S wfrc-git wf-recorder
sudo pacman -S libva-utils

lspci -k | grep -A 2 -E "(VGA|3D)"
##########################################################################################
01:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeForce GTX 1050] (rev a1)
Subsystem: Shenzhen Colorful Yugong Technology and Development Co. Device 0000
Kernel driver in use: nouveau
##########################################################################################

lspci | grep -i nvidia
##########################################################################################
01:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeForce GTX 1050] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GP107GL High Definition Audio Controller (rev a1)
##########################################################################################

lsmod | grep nouveau
# bash
sudo tee /etc/modprobe.d/blacklist-nouveau.conf <<EOF
blacklist nouveau
options nouveau modeset=0
EOF
sudo mkinitcpio -P
sudo pacman -S nvidia-dkms nvidia-settings nvidia-utils

vainfo
ls -l /dev/dri/by-path
wl-screenrec --no-hw
