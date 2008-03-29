From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 06:37:35 +0000
Subject: [Buildroot] kernel compilation vs. -O0
Message-ID: <1206772655.3224.118.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Feeding the kernel zero optimization -O0 breaks the kernel build at
least on x86 with ASM errors.

Any objections to filtering -O0 out?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-no-zero-optimization.patch
Type: text/x-patch
Size: 692 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080329/c95e134e/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/c95e134e/attachment.pgp 
