From: Benjamin Delagoutte <BDE@teamlog.com>
Date: Tue, 12 Sep 2006 10:36:30 +0200
Subject: [Buildroot] patch : fix uClibc.config
Message-ID: <1158050190.1935.3.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc version : snapshot
problem : I always get prompted for some symbols that are missing in
default uClibc.config file (ARCH_USE_MMU, UCLIBC_HAS_ARC4RANDOM etc.).

This patch should solve this by adding missing symbols to uClibc.config.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-uclibc_config.patch
Type: text/x-patch
Size: 1015 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060912/4f79c81f/attachment.bin 
