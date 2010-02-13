From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sat, 13 Feb 2010 13:51:26 -0800 (PST)
Subject: [Buildroot] Persistent U-Boot environment variables under QEMU
Message-ID: <727912.43003.qm@web44816.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am experimenting with Buildroot under QEMU, using buildroot-2009.11 and buildroot-2010.02-rc1.

So far, so good.  I can boot a Linux kernel and RFS built by Buildroot under QEMU (versatilepb) where the RFS is exported via NFS.

QEMU includes a boot loader, so U-Boot is not needed.  But I use U-Boot with real ARM hardware, so I would like to experiment with U-Boot under QEMU, adding DHCP and TFTP to the mix.

With real hardware, the U-Boot environment variables are persistent in flash memory.

Is there a way to simulate this with QEMU?  I would not go to the trouble to manually enter the U-Boot environment variables each time I boot under QEMU, but if there is a persistence mechanism available then including U-Boot might be practical.

Thanks.

Jim



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100213/f1ccaebb/attachment-0001.htm>
