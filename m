From: Paul Kuntke <paul@42degreesoffreedom.com>
Date: Wed, 11 Jan 2012 10:02:28 +0100
Subject: [Buildroot] Unable to boot via initrd
Message-ID: <20120111090228.GA3269@krikkit>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,
I'm very new to buildroot and building Initrds and I would like to set up a
minimalistic environment for booting PCs (i386) over PXE. 

For this I would like to set up a Kernel and an initrd as System-Filesystem.
After everything was build fine I wanted to test the environment. But every
tries ended in a Kernel-Panic moaning about no /init to find. I've also tried
to set the "init" kernel-parameter to /bin/busybox. But even then it is not
able to start /bin/busybox. 

As testing environment I tried qemu as well as some real PCs with syslinux
over PXE. 

Kernel-Parameters I've tried: "root=/dev/ram init=/init" 
As Initrd I tried to use the bzImage with the build in initrd-image as well as
the rootfs.cpio.bz2 or rootfs.cpio.

Do I have to set some special Kernel-Params or do I have to set some special
options in the buildroot config?

Thanks,
 Paul

-- 
Paul Kuntke <paul@42degreesoffreedom.com>

Jabber-ID: paul at 42degreesoffreedom.com

This Mail is signed via gpg. 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 196 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120111/d6931a46/attachment.asc>
