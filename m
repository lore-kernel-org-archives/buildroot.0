From: Matthieu <matthieu.personnaz@wanadoo.fr>
Date: Mon, 2 Sep 2013 12:06:42 -0700 (PDT)
Subject: [Buildroot] Unable to boot via initrd
Message-ID: <1378148801760-50517.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


I have just installed the 2013-08 version of buildroot and I do not succed
to boot via initrd.
I tried two solutions (described in the previous post "Creating initrd")
through the gui menuconfig. And neither solution seems succeed.

When I run:

1) for the solultion 1 (BR2_TARGET_ROOTFS_INITRAMFS=y)
kvm -kernel output/images/bzImage -initrd output/images/rootfs.cpio.bz2 -m
128

2) for the solution 2: (BR2_TARGET_ROOTFS_CPIO=y)
kvm -kernel output/images/bzImage -initrd output/images/rootfs.cpio.bz2
-initrd output/images/rootfs.cpio.bz2 -m 128

I always obtain:
VFS: Cannot open root device "(null)" .... error -6 ...
Please append a coorect "root)" boot option; here are the available
partitions: Kernel panic ....VFS: Unable to mount root fs on
unknown-block(0,0)


Please can you help me?

regards

Matthieu



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Unable-to-boot-via-initrd-tp50517.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
