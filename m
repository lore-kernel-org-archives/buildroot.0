From: Joe Pruett <joey@clean.q7.com>
Date: Tue, 12 Dec 2006 09:13:34 -0800 (PST)
Subject: [Buildroot] targetting buildroot at vmware
In-Reply-To: <20061212130045.GB30226@aon.at>
References: <Pine.LNX.4.64.0612112143590.26350@q7.q7.com>
	<20061212085344.GA5002@aon.at>
	<010e01c71de9$943efd50$0f31b10a@atmel.com>
	<20061212130045.GB30226@aon.at>
Message-ID: <Pine.LNX.4.64.0612120910180.20521@q7.q7.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >> There is no difference whether you build a rootfs for real hardware or
> >> for any simulator, be it vmware, bochs, plex86, qemu, you-name-it). Just
> >> build your rootfs, install a bootloader into an empty "disk" (you'd
> >> normally use a file for this) and put your rootfs into a partition on
> >> your "disk". Boot and enjoy.
> >
> >I think he wants to create a complete disk for VMware, 
> >and I believe that is it not possible.
> 
> As long as you can cnofigure vmware to use file as disk or partition it
> certainly is possible.
> I regularly use qemu to boot a file that acts as disc-image, including
> grub as a bootloader etc. If vmware doesn't support using a file as disk
> or a spare partition, then bug vmware. It's a commercial program, AFAIK.
> 
> >Once a complete disk is available, the file system created in 
> >VMware can be copied to the disk.
> 
> create a file, partition it, format the partitions. Install a bootloader
> if you want (qemu can also boot a given kernel/initrd, so that's
> optional) and untar the rootfs on it. Done, no magic involved :)
> 
> qemu is free software and may also work on windows or BSD-apple, so just
> use that instead of vmware.

i am also looking for info about tweaks i might need to make to get 
networking, disks, etc to work.  i currently ran into the same limits.h 
issue i see being talked about on the list.  i'm going to try again with 
non-snapshot versions.

i have looked at qemu, but i think vmware is more amenable to my desires.
