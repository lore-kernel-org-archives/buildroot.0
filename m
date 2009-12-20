From: Nigel Kukard <nkukard@lbsd.net>
Date: Sun, 20 Dec 2009 21:26:49 +0000
Subject: [Buildroot] Patches
Message-ID: <4B2E9699.3090100@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

01-e2fs:
Install uuid.h into staging for other apps to use

02-neon:
Allow neon to be compiled with ssl support

03-xfsprogs:
Update & fixup xfs progs, requires 01-e2fs.patch

04-rpm:
Update rpm and pull in patches from upstream


-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 01-e2fs.patch
Type: text/x-patch
Size: 749 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091220/e6281e29/attachment-0004.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 02-neon.patch
Type: text/x-patch
Size: 907 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091220/e6281e29/attachment-0005.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 03-xfsprogs.patch
Type: text/x-patch
Size: 4666 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091220/e6281e29/attachment-0006.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 04-rpm.patch
Type: text/x-patch
Size: 17992 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091220/e6281e29/attachment-0007.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 262 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091220/e6281e29/attachment-0001.pgp>
