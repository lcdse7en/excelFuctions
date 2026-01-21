lsblk
cfdisk /dev/sda # /dev/sda1 +1G (EFI System) || /dev/sda2 +... (Linux filesystem)
fdisk -l

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot

# (if error) pacman -Sy archlinux-keyring
pacstrap -K /mnt base base-devel linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locele-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "archlinux" > /etc/hostname

passwd

pacman -S grub efibootmgr networkmanager

grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

pacman -S vim sudo openssh git

useradd -m -G wheel se7en
passwd se7en

EDITOR=vim visudo

exit
umount -R /mnt
reboot
