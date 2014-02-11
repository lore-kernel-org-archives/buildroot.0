From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 11 Feb 2014 15:03:13 +0100 (CET)
Subject: [Buildroot] Antw: Re: Antw: Re: Antw: Re: How to get the kernel
 to mount a rootfs without an initramfs ??
In-Reply-To: <52FA3919020000460004A883@gwia2.rz.hs-offenburg.de>
Message-ID: <548043547.5283604.1392127393366.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Well I'll try, but why then is the initramfs working? the only files
> i got on a sd is the boot.bin, u-boot.bin and kernel.bin (with
> initramfs) and I'm using this on a SD card as it came from the
> factory and it's working. I'll try the trick with partition the sd
> card now, let's see if that helps.
> 

if you got files on the SD then your SD is partitioned and has a single
FAT partition. I'm not sure where you put your squash fs... as an image
file on the SD card (i.e on the FAT partition of the SD card )
