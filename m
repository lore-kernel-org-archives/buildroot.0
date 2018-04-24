From: Stefan Kuhne <Stefan.Kuhne@gmx.net>
Date: Tue, 24 Apr 2018 16:36:22 +0200
Subject: [Buildroot] Add files to ISO and not to initrd
Message-ID: <6d4f6c41d7c5f951b820dae69bae6bb8@access.denied>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I upgraded from buildroot-2016.11.2 to 2018.02.1 and now I've a problem.
I used ROOTFS_ISO9660_PRE_GEN_HOOKS to add files to iso. But now it 
works only with "BR2_TARGET_ROOTFS_INITRAMFS = n" and 
"BR2_TARGET_ROOTFS_ISO9660_INITRD = n" but I want to use initrd.

What is the new way to add files to iso?

Thanks,
Stefan
