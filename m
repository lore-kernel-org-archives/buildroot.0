From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 03 Jul 2014 19:36:50 +0800
Subject: [Buildroot] systed-remount-fs rootfs issue
Message-ID: <53B54052.6040900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm trying to get buildroot working on an x86_64 machine (pentium d) and
I was having some trouble getting root as rw. I've found that even if /
is set to mount rw in fstab, systemd-remount-fs doesn't mount it as rw
(as from what I've read it should).

I have however, got rw on root by adding "rw" to the kernel command line.

Thanks!

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 880 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140703/b7d2e53b/attachment.asc>
