From: Nigel Kukard <nkukard@lbsd.net>
Date: Sun, 30 Mar 2008 16:46:39 +0000
Subject: [Buildroot] bzip2 -9'd kernel modules
Message-ID: <1206895599.3290.7.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As some may know, module-init-tools contains support for gzip'd kernel
modules.

Anyone interested in bzip2'd modules?

I just took my 2.6.22 modules...
Unstripped - 47Mb
Strippped (-g) - 45Mb
Gzipped - 15Mb
Bzip2'd - 13Mb


any thoughts?  the module-init-tools code is pretty simplistic to patch
with bzip2 support.

With that maybe an option under module-init-tools to automagically
gzip/bzip2 them?

Obviously this adds some overhead requiring libz or libbz2 ... 100kb
odd.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080330/f39cbd41/attachment.pgp 
