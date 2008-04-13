From: Nigel Kukard <nkukard@lbsd.net>
Date: Sun, 13 Apr 2008 17:25:32 +0000
Subject: [Buildroot] uclibc snapshot config fix
Message-ID: <1208107532.6817.578.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It should fix any bumps in the uclibc config when using a snapshot.

I've also added the ARM config options like is done with the MIPS.

Works for me, but I'd appreciate some testing  ;)

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc-snapshot.patch
Type: text/x-patch
Size: 7445 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080413/f562d48a/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080413/f562d48a/attachment.pgp 
