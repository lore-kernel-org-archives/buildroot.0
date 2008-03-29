From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 15:12:02 +0000
Subject: [Buildroot] adding packages to buildroot
Message-ID: <1206803522.3224.186.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anybody got anything against me adding and maintaining the following
packages...

rpm5 - 4.4.9 & 5.0.x (+- 9 patches to support uclibc)
depends: libneon
depends: libbeecrypt

busybox's rpm is great, but lacks functionality which one can use for
emergency recovery.

bootutils - implements a switchroot alternative which supports automatic
discovery of root device/filesystem and emergency shell execution if
root device cannot be found or mounted. initramfs+bootutils+busybox
+dropbear  <= perfect rescue initramfs/initrd.


-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/6ae85ee0/attachment.pgp 
