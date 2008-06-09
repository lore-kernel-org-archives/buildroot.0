From: Kieran Bingham <kieranbingham@gmail.com>
Date: Mon, 09 Jun 2008 14:24:15 +0100
Subject: [Buildroot] GCC build tries to strip "ld script"
Message-ID: <484D2EFF.9010808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using buildroot to make a GCC 4.1.2 toolchain, on a second pass of build 
(after say changing uClibc) the GCC build was failing as it was trying 
to strip the *-ld file in the binary location.

The attached patch file changes toolchain/gcc/gcc-uclibc-3.x.mk and 
toolchain/gcc/gcc-uclibc-4.x.mk to prevent them stripping %-ld

--
Regards
Kieran Bingham
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-GCC-build-to-prevent-stripping-LD-script-file.patch
Type: text/x-diff
Size: 0 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080609/83a1ae3f/attachment.patch 
