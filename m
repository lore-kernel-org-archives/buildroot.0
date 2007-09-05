From: Roderick Taylor <myopiate@gmail.com>
Date: Wed, 5 Sep 2007 22:48:39 +1000
Subject: [Buildroot] [PATCH] Bug ID 0001474, arch x86_64 ,
	variant core2 does not build
Message-ID: <e83232070709050548y32c8f348w28317b35187810cc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--with-tune=core2 not implemented in GCC 4.2.1 and GCC 4.3 is not yet
a buildroot option for x86_64

This patch sets BR2_TARGET_TUNE and BR2_TARGET_ARCH to generic instead
of core2 when the core2 variant is selected.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: core2-generic.patch
Type: text/x-patch
Size: 1109 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070905/e560d0b8/attachment.bin 
