From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 28 Jun 2018 10:16:46 -0300 (BRT)
Subject: [Buildroot] Booting into grub> prompt
In-Reply-To: <2C6957468785C14D8F47AB016E1D8F4B269C6CF1@hasmsx108.ger.corp.intel.com>
References: <2C6957468785C14D8F47AB016E1D8F4B269C6CF1@hasmsx108.ger.corp.intel.com>
Message-ID: <23119300.395175.1530191806180.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Montag, Gil" <gil.montag@intel.com>
> To: "buildroot" <buildroot@busybox.net>
> Sent: Thursday, June 28, 2018 9:02:16 AM
> Subject: [Buildroot] Booting into grub> prompt

> Hi,

> I created a buildroot EFI disk.img file (X64)

> For some reason, when UEFI bios boots this image, it brings up ?grub>? prompt
> but not proceeding to boot the OS

> Nor does it present the Menuentry defined in \EFI\BOOT\grub.cfg file

> If looks as if grub does not ?see? the grub.cfg file although both sit in the
> same \EFI\BOOT folder.

> I did a loopback mount to the disk.img file and here is the structre:

> gmontag1 at gmontag1-desktop from_guy (master) $ ls -R /mnt/gil
> /mnt/gil:

> bzImage EFI startup.nsh

> /mnt/gil/EFI:
> BOOT

> /mnt/gil/EFI/BOOT:
> bootx64.efi grub.cfg

> What am I doing wrong?

Did you use configs/pc_x86_64_efi_defconfig or some custom configuration?

Post your defconfig here if it is short. Share it on pastebin.com or some
similar service if it is large.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
