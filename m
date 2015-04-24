From: =?utf-8?Q?Pongr=C3=A1cz_Istv=C3=A1n?= <pongracz.istvan@gmail.com>
Date: Fri, 24 Apr 2015 22:34:44 +0200
Subject: [Buildroot] Kernel panic - unable to mount root fs on
	unknown-block(0, 0) - i486
Message-ID: <92c9421a9c3260f1653ab207e9b9d4d4@www.startit.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 Hi,

I have a problem with booting kernel built by buildroot on i486. The kernel (3.18.x) panicked: Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

I use the latest buildroot, the target is i486. I used a kernel config from a known working older kernel and double checked, all ext2/ext3 etc. built directly to the kernel, so, seems every necessary drivers built directly to the kernel (not as modules).

I tried to boot from usb. There is no initramfs (initrd).

If I get a different kernel from an other system, which is working, and I started the buildroot generated system with that kernel, it can boot as expected. Same kernel parameters.

Does it sound familiar to somebody?

My goal is to get a console based system optimized to i486, including kernel.

What am I missing?

Thanks, 

Istv?n
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150424/845dbd56/attachment.html>
