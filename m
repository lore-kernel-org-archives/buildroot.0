From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 11 Feb 2014 10:53:43 +0100 (CET)
Subject: [Buildroot] Antw: Re: Antw: Re: How to get the kernel to mount
 a rootfs without an initramfs ??
In-Reply-To: <52F9F84E020000460004A7CD@gwia2.rz.hs-offenburg.de>
Message-ID: <1102199395.5272670.1392112422985.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> the kernel panic message is the following:
> 
> VFS: Cannot open root device "mmcblk0" or unknow-block(0,0) Please
> append a correct "root=" boot option; here are the available
> partitions: not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> 
> As far as I know I have never partitioned the SD at all, so I don't
> think p1 is important then. Maybe it's easier if you can send me
> your command line , so I know what's the "truth" and look up what
> went wrong here
> 


well, I don't understand where is your rootfs, then... do you have
a single partition on the SD ? you do need to have a partition 
table afaik, even for a single partition. 

Try to partition your SD card with a partition editor and then 
adding the squashfs as the first partition
