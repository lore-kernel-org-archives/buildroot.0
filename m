From: Matthieu <matthieu.personnaz@wanadoo.fr>
Date: Wed, 4 Sep 2013 04:38:43 -0700 (PDT)
Subject: [Buildroot] Unable to boot via initrd
In-Reply-To: <20130904095003.05160a45@skate>
References: <1378148801760-50517.post@n4.nabble.com> <52260A30.309@mind.be>
 <1378248110591-50638.post@n4.nabble.com> <20130904095003.05160a45@skate>
Message-ID: <1378294723839-50675.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas and  Arnout,

first I want to thank you for your understanding. I come back to the linux
world after 10 years and I feel rusted.

So:

1) in the root of the filesystem there is a symlink to /sbin/init.

2) I noticed the solution 2 of my first post do not work:
BR2_TARGET_ROOTFS_CPIO=y and BR2_TARGET_ROOTFS_INITRAMFS disabled. When I
run:

kvm -kernel output/images/bzImage -initrd output/images/rootfs.cpio.bz2

I obtain:  VFS: Cannot open root device "(null)" .... error -6 ... 

is there a solution?

regards

Matthieu



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Unable-to-boot-via-initrd-tp50517p50675.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
