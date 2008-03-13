From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 13 Mar 2008 18:05:27 +0000
Subject: [Buildroot] RFC: initramfs & fakeroot
Message-ID: <1205431527.10692.457.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hrmmm,

A normal non-priv user cannot create an iniramfs image, makedevs borks
out with operation not permitted on the device files.

1. Why even use makedevs? why not parse the device file list directly
into gen_initramfs_list.sh?

2. Would one even require fakeroot then? all its doing is hiding errors
and creating files instead of devs?

Maybe I'm missing something?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080313/3cbd1bba/attachment.pgp 
