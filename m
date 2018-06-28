From: Montag, Gil <gil.montag@intel.com>
Date: Thu, 28 Jun 2018 12:02:16 +0000
Subject: [Buildroot] Booting into grub> prompt
Message-ID: <2C6957468785C14D8F47AB016E1D8F4B269C6CF1@hasmsx108.ger.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I created a buildroot EFI  disk.img file (X64)
For some reason, when UEFI bios boots this image, it brings up "grub>" prompt but not proceeding to boot the OS
Nor does it present the Menuentry defined in \EFI\BOOT\grub.cfg file
If looks as if grub does not "see" the grub.cfg file although both sit in the same \EFI\BOOT folder.
I did a loopback mount to the disk.img file and here is the structre:

gmontag1 at gmontag1-desktop from_guy (master) $ ls -R /mnt/gil
/mnt/gil:

bzImage EFI startup.nsh

/mnt/gil/EFI:
BOOT

/mnt/gil/EFI/BOOT:
bootx64.efi grub.cfg

What am I doing wrong?

Thanks
Gil

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180628/78e34059/attachment.html>
